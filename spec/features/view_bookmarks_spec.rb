feature 'to view bookmarks' do
  scenario 'displays list of bookmarks' do
    visit '/bookmarks'
    expect(page).to have_content 'http://www.destroyallsoftware.com'
  end
end