class Song < ActiveRecord::Base
  belongs_to :artist

  def artist_name
    self.try(:artist).try(:name)
  end

  def artist_name=(name)
    artist = Artist.find_or_create_by(name: name)
    self.artist = artist
  end

  def index

    if params[:artist_id]
      @songs = Song.find(params[:artist_id]).songs
    else
      @songs = Song.all
    end

  end

  def show

  end
end
