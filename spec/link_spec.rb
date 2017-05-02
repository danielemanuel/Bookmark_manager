
  feature "view the link" do
    scenario 'displays the link on the page' do
        Link.create(url: 'http://www.makersacademy.com', title: 'Makers Academy')
        visit '/links'
        expect(page.status_code).to eq 200
        whithin 'ul#links' do
        expect(page).to have_content('Makers Academy')
      end 
      end
    end
