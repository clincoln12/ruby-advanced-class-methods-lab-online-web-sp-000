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
    @@all << song
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
    @@all << song
    song
  end
  
  def self.find_by_name(name)
    @@all.find {|song| song.name == name }
  end
  
  def self.find_or_create_by_name(name)
    if find_by_name(name) == nil
      create_by_name(name)
    else
      find_by_name(name)
    end
  end
  
  def self.alphabetical
    @@all.sort_by {|x| x.name}
  end
  
  def self.new_from_filename(name)
    song = self.new 
    song.name = name.split(" - ")[1].gsub(".mp3", "")
    song.artist_name = name.split(" - ")[0]
    song
  end

end









