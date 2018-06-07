require 'pry'

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

def self.new_by_name(song_name)
song = Song.new
song.name = song_name
song
end

def self.create_by_name(song_name)
song = self.create
song.name = song_name
song
end

def self.find_by_name(song_name)
self.all.detect {|song| song.name == song_name}
end

def self.find_or_create_by_name(song_name)
if (self.find_by_name(song_name) != nil)
    find_by_name(song_name)
    else
    create_by_name(song_name)
end
end

def self.alphabetical
self.all.sort_by do |song|
    song.name
end
end

def self.new_from_filename (song)
song_array = song.split(/\-|\./)
new_Song = self.new_by_name(song_array[1].strip)
new_Song.artist_name = song_array[0].strip
new_Song
end


def self.create_from_filename(song)
song_array = song.split(/\-|\./)
new_Song = self.create_by_name(song_array[1].strip)
new_Song.artist_name = song_array[0].strip
new_Song
end

def self.destroy_all
self.all.clear
end

end
