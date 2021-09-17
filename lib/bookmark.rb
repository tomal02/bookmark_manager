require 'pg'

class Bookmark
  attr_reader :id, :url, :title

  def initialize(id:, title:, url:)
    @id = id
    @title = title
    @url = url
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      con = PG.connect(dbname: 'bookmark_manager_test')
    else
      con = PG.connect(dbname: 'bookmark_manager')
    end
    rs = con.exec("SELECT * FROM bookmarks;")
    rs.map do |row|
      Bookmark.new(title: row['title'], id: row['id'], url: row['url'])
    end
  end

  def self.create(url:, title:)
    if ENV['ENVIRONMENT'] == 'test'
      con = PG.connect(dbname: 'bookmark_manager_test')
    else
      con = PG.connect(dbname: 'bookmark_manager')
    end
    result = con.exec_params("INSERT INTO bookmarks (url, title) VALUES ($1, $2) RETURNING id, url, title", [url, title])
    Bookmark.new(id: result[0]['id'], title: result[0]['title'], url: result[0]['url'])
  end
end
