require_relative 'web_helpers'

feature 'User sign up' do
  scenario 'I can sign up as a new user' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, daniel.costea@vkernel.ro')
    expect(User.first.email).to eq('daniel.costea@vkernel.ro')
  end
end
