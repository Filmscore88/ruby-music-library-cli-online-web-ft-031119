require 'pry'
class MusicLibraryController

  def initialize(path= "./db/mp3s")
   
    MusicImporter.new(path).import
  end 
  
  def call 
    


def list_songs
  sorted_songs= Song.all.sort_by { |song| song.name }
  
  sorted_songs.each_with_index{|song,index|
    puts "#{index +1}. #{reformat_song(song)}"
  }
end 


def reformat_song (song)
  "#{song.artist.name} - #{song.name} - #{song.genre.name}"
end 

def list_artists
  sorted_artist= Artist.all.sort_by{|artist| artist.name}
      sorted_artist.each_with_index{|artist,index|
         puts "#{index +1}. #{artist.name}"
  }
end 

def list_genres
   sorted_genres= Genre.all.sort_by{|genre| genre.name}
      sorted_genres.each_with_index{|genre,index|
         puts "#{index +1}. #{genre.name}"
  }
end

  def list_songs_by_artist
  puts "Please enter the name of an artist:"
  input = gets.chomp

      if artist = Artist.find_by_name(input)
        sorted_songs= artist.songs.sort_by{|song|song.name}
        sorted_songs.each.with_index{ |song, i|
         puts "#{i+1}. #{song.name} - #{song.genre.name}"
        }
    end
  end
  
  def list_songs_by_genre
  puts "Please enter the name of a genre:"
  genre= gets.chomp
    
       if genre = Genre.find_by_name(genre)
        sorted_songs= genre.songs.sort_by{|song|song.name}
        sorted_songs.each.with_index{ |song, i|
         puts "#{i+1}. #{song.artist.name} - #{song.name}"
        }
    end
  end 
  
  def play_song
    sorted_songs= Song.all.sort_by { |song| song.name }
    
    puts "Which song number would you like to play?"
    input=gets.chomp.to_i
      if input > 0 &&  input <= sorted_songs.length 
       song=sorted_songs[input-1]
        puts "Playing #{song.name} by #{song.artist.name}"
      end 
  end
  



end