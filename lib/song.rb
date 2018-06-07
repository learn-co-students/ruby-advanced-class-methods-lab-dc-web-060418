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
    song = self.new
    song.save
    song
  end

  def self.new_by_name(song_name)
    #binding.pry
    song = self.create
    song.name = song_name
    song.save
    song
  end

  def self.create_by_name(song_name)
    song = self.create
    song.name = song_name
    song.save
    song
  end

  def self.find_by_name(song_name)
    self.all.detect {|song| song.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
    song = self.find_by_name(song_name)

    if song == nil
      self.create_by_name(song_name)
    else
      song
    end
  end

  def self.alphabetical
    self.all.sort {|a,b| a.name <=> b.name}.uniq
  end

  def self.new_from_filename(file)
    song = self.create
    song_data = file.split(" - ")
    song.name = song_data[1].split(".")[0]
    song.artist_name = song_data[0]
    song.save
    song
  end

  def self.create_from_filename(file)
    song = self.create
    song_data = file.split(" - ")
    song.name = song_data[1].split(".")[0]
    song.artist_name = song_data[0]
    song.save
    song
  end

  def self.destroy_all
    self.all.clear 
  end

end
