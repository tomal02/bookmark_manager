feature 'Adding bookmarks' do
  scenario 'User is able to add bookmarks' do
    visit 'add_bookmark'
    fill_in 'add_bookmark', with: 'http://www.makersacademy.com'
    click_button 'Submit'
    expect(page).to have_content 'http://www.makersacademy.com'
  end
end