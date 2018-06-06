class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = Song.new
    song.save
    song
  end

  def self.new_by_name(name)
    new_song = Song.new
    new_song.name = name
    new_song

  end

  def self.create_by_name(name)
    new_song = self.new_by_name(name)
    new_song.save
    new_song
  end

  def self.find_by_name(name)
    self.all.detect {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) == nil
      #if song is not found in @@all, create new one
      return self.create_by_name(name)
    else
      #if song is found in @@all, give back the found song
      self.find_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name} 
  end

  def self.new_from_filename(name)
    song_info = name.split(".")[0].split(" - ")
    #binding.pry
    new_song = self.new_by_name(song_info[1])
    new_song.artist_name = song_info[0]
    new_song
  end

  def self.create_from_filename(name)
    song_info = name.split(".")[0].split(" - ")
    new_song = self.create_by_name(song_info[1])
    new_song.artist_name = song_info[0]
  end

  def self.destroy_all
    self.all.clear
  end

end

