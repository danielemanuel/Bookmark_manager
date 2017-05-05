

def sign_up
  visit '/users/new'
  expect(page.status_code).to eq(200)
  fill_in :email,    with: 'daniel.costea@vkernel.ro'
  fill_in :password, with: 'daniel'
  fill_in :password_confirmation, with: 'daniel'
  click_button 'Sign up'
end
