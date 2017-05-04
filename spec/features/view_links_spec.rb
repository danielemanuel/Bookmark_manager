feature 'Viewing links' do

    scenario 'I can filter links by tag' do
      Link.create(url: 'http://www.bubble-bobble.com', title: 'Bubble Bobble', tags: [Tag.first_or_create(name: 'bubbles')])
      visit '/tags/bubbles'
      expect(page.status_code).to eq(200)
      within 'ul#links' do
      expect(page).to have_content('Bubble Bobble')
      end
    end

    scenario 'user can add multiple tags to the url' do
      visit '/links/new'
      fill_in 'url',   with: 'http://www.makersacademy.com/'
      fill_in 'title', with: 'Makers Academy'
      fill_in 'tags',  with: 'education ruby'
      click_button 'Create link'
      link = Link.first
      expect(link.tags.map(&:name)).to include('education', 'ruby')
    end
  end



    # scenario "The user can view a list of links associated with requested tag" do
    #   link = Link.create(url: 'http://www.google.com', title: 'Google')
    #   tag = Tag.create(tag_name: 'bubbles')
    #   link.tags << tag
    #   link.save
    #   visit '/tags/bubbles'
    #   expect(page).to have_content('http://www.google.com')
    # end
