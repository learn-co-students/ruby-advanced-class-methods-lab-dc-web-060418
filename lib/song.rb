require 'pry'

class Song

  attr_accessor :name, :artist_name

  #array of song info for all instances of class
  @@all = []

  #retrieves @@all array
  def self.all
    @@all
  end

  #saves instance of class to @@all array
  def save
    self.class.all << self
  end

  def self.create
    self.new.save
    @@all[-1]
  end

  def self.new_by_name(song_title)
    new_song = song_title
    song = self.new
    song.name = new_song
    song
  end

  def self.create_by_name(song_title)
    self.new_by_name(song_title).save
    @@all[-1]
  end

  def self.find_by_name(song_title)
    self.all.detect{|song| song.name == song_title}
  end

  def self.find_or_create_by_name(song_title)
    if self.find_by_name(song_title) == nil
      self.create_by_name(song_title)
    else
      self.find_by_name(song_title)
    end
  end

  def self.alphabetical
    self.all.sort_by{|song| song.name}
  end

  def self.new_from_filename(filename)
    data = filename.split(".")[0].split(/ - /)
    song = self.new
    song.artist_name = data[0]
    song.name = data[1]
    song
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename).save
  end

  def self.destroy_all
    @@all.clear
  end

end
