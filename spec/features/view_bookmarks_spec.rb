feature 'to view bookmarks' do
  scenario 'displays list of bookmarks' do
    connection = PG.connect(dbname: 'bookmark_manager_test')

    connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.makersacademy.com');")
    
    visit '/bookmarks'
    expect(page).to have_content 'http://www.makersacademy.com'
  end
end