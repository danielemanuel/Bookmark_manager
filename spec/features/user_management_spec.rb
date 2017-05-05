require_relative 'web_helpers'

feature 'User sign up' do
  scenario 'I can sign up as a new user' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, daniel.costea@vkernel.ro')
    expect(User.first.email).to eq('daniel.costea@vkernel.ro')
  end

  scenario 'sign up fails if passwords do not match' do
    visit '/users/new'
    expect(page.status_code).to eq(200)
    fill_in :email,    with: 'jessicabarclay@email.com'
    fill_in :password, with: 'jessica'
    fill_in :password_confirmation, with: 'password'
    click_button 'Sign up'
    expect(page).not_to have_content('Welcome, jessicabarclay@email.com')
  end
end
