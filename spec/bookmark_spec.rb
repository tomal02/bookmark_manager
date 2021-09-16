require 'bookmark'

describe Bookmark do
  describe '#all' do
    it 'returns all bookmarks' do
      connection = PG.connect(dbname: 'bookmark_manager_test')

      bookmark = Bookmark.create(url: 'http://www.makersacademy.com', title: 'Makers')
      Bookmark.create(url: 'http://www.destroyallsoftware.com', title: 'Destroy')
      Bookmark.create(url: 'http://www.google.com', title: 'Google')

      bookmarks = Bookmark.all

      expect(bookmarks.length).to eq 3
      expect(bookmarks.first).to be_a Bookmark
      expect(bookmarks.first.id).to eq bookmark.id
      expect(bookmarks.first.title).to eq 'Makers'
      expect(bookmarks.first.url).to eq 'http://www.makersacademy.com'
    end
  end

  describe '#create' do
    it 'Creates new bookmark' do
      bookmark = Bookmark.create(url: 'www.google.com', title: 'Google')
      persisted_data = persisted_data(id: bookmark.id)

      expect(bookmark.title).to eq 'Google'
      expect(bookmark.id).to eq persisted_data['id']
      expect(bookmark).to be_a Bookmark
      expect(bookmark.url).to eq 'www.google.com'
    end
  end
end