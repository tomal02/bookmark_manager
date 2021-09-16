feature 'Adding bookmarks' do
  scenario 'User is able to add bookmarks' do
    visit 'add_bookmark'
    fill_in 'title', with: 'Makers'
    fill_in 'url', with: 'http://www.makersacademy.com'
    click_button 'Submit'
    expect(page).to have_link('Makers', href: 'http://www.makersacademy.com')
  end
end