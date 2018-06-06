class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def self.create 
    song = self.new
    self.all << song 
    song
  end 

  def self.new_by_name(name)
    song = self.new
    song.name = name 
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name 
    self.all <<  song 
    song
  end

  def self.find_by_name(name)
    self.all.detect{|song| song.name == name}
  end 

  def self.find_or_create_by_name(name)
    find = self.find_by_name(name)
    !!find ? find : self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort do |a, b|
      if(a.name > b.name)
        1
      elsif(a.name < b.name)
        -1
      else
        0
      end 
    end 
  end 
  
  def self.new_from_filename(filename)
    split_name = filename.sub('.mp3','').split(" - ")
    song = self.new_by_name(split_name[1])
    song.artist_name = split_name[0]
    song
  end 

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    self.all << song 
    song
  end 

  def self.destroy_all
    self.all.clear
  end 

  def save
    self.class.all << self
  end

end
