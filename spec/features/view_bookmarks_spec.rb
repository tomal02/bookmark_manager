feature 'to view bookmarks' do
  scenario 'displays list of bookmarks' do
    connection = PG.connect(dbname: 'bookmark_manager_test')

    Bookmark.create(title: 'Makers', url: 'http://www.makersacademy.com')
    
    visit '/bookmarks'
    expect(page).to have_link('Makers', href: 'http://www.makersacademy.com')
  end
end