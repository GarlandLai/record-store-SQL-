require ('pry')

class Album
  attr_accessor :name

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id) # Note that this line has been changed.
  end

  def self.all
    returned_albums = DB.exec("SELECT * FROM albums;")
    albums = []
    returned_albums.each() do |album|
      name = album.fetch("name")
      id = album.fetch("id").to_i
      albums.push(Album.new({:name => name, :id => id}))
    end
    albums
  end

  def save
    result = DB.exec("INSERT INTO albums (name) VALUES ('#{@name}') RETURNING id;")
    @id = result.first().fetch("id").to_i
  end

  def == (album_to_compare)
    self.name() == album_to_compare.name()
    # self.artist() == album_to_compare.artist()
    # self.genre() == album_to_compare.genre()
    # self.year() == album_to_compare.year()
  end

  def self.clear
    DB.exec("DELETE FROM albums *;")
  end

  def self.find(id)
    album = DB.exec("SELECT * FROM albums WHERE id = #{id};").first
    name = album.fetch("name")
    id = album.fetch("id").to_i
    Album.new({:name => name, :id => id})
  end

  def self.search(name)
    @@albums.values.select do |album|
    album.name == name
    end
  end

  def self.sort
    array = @@albums.sort_by {|key, val| val.name}
    @@albums = Hash[array.map { |key, val | [key,val]}]
  end


  def update(name)
    @name = name
    DB.exec("UPDATE albums SET name = '#{@name}' WHERE id = #{@id};")
  end

  def delete
    DB.exec("DELETE FROM albums WHERE id = #{@id};")
  end

  def songs
    Song.find_by_album(self.id)
  end
end
