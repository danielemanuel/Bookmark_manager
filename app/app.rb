ENV["RACK_ENV"] ||= "development"
require 'sinatra/base'
require_relative 'models/link'
require_relative 'models/user'
require_relative 'models/tag'
require_relative 'data_mapper_setup'
require          'sinatra/flash'


class BookmarkManager < Sinatra::Base
    enable :sessions
    set :session_secret, 'super secret'
    register Sinatra::Flash

    get '/links' do
      @links = Link.all
      erb :'links/index'
    end

    get '/links/new' do
      erb :'links/new'
    end

    post '/links' do
      link = Link.new(url: params[:url], title: params[:title])
      params[:tags].split.each do |tag|
      link.tags << Tag.first_or_create(name: tag)
    end
      link.save
      redirect '/links'
    end

    get '/tags/:name' do
      tag = Tag.first(name: params[:name])
      @links = tag ? tag.links : []
      erb :'links/index'
    end

    get '/users/new' do
      @user = User.new
      erb :'links/users'
    end

    post '/users' do
      @user = User.create(email: params[:email],
                        password: params[:password],
                        password_confirmation: params[:password_confirmation])
      session[:user_id] = @user.id
    if @user.save
      session[:user_id] = @user.id
      redirect to ('/links')
    else
      flash.now[:error] = 'Passwords do not match'
      erb :'links/users'
    end
  end

    helpers do
      def current_user
        @current_user ||= User.get(session[:user_id])
      end
    end

end
