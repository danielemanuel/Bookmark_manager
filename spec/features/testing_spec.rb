
  feature 'Testing infrastructure' do
    scenario 'Checks the apps if is running ' do
      visit('/')
      expect(page).to have_content     'Hey Daniel, I\'m ready to go!'
    end
  end
