class SongsController < ApplicationController

  def index
    @songs = Song.all
  end

  def create
    song = Song.new(songs_params)
    begin
      song.save!
      flash[:notice] = "Canção #{song.name} criada com sucesso!"
      redirect_to song_path(song)
    rescue => err
      flash[:notice] = err
      if flash[:has_album_id]
        redirect_to new_song_path(:album_id => flash[:has_album_id])
      else
        redirect_to new_song_path
      end
    end
  end

  def new
    @song = Song.new
    @genres = Genre.order(:descriptor)
    if params.has_key?(:album_id)
      @albums = Album.where(:id => params[:album_id])
      # Flash current album id in case problem occurs on create
      flash[:has_album_id] = params[:album_id]
    else
      @albums = Album.order(:name)
    end
  end

  def edit
    @song = Song.find(params[:id])
    @genres = Genre.order(:descriptor)
    @albums = Album.order(:name)
  end

  def show
    @song = Song.find(params[:id])
  end

  def update
    song = Song.find(params[:id])
    begin
      song.update!(songs_params)
      flash[:notice] = "Canção #{song.name} modificada com sucesso!"
      redirect_to song_path(song)
    rescue => err
      flash[:notice] = err
      redirect_to edit_song_path
    end
  end

  def destroy
    song = Song.find(params[:id])
    object_url = song_url(song)
    begin
      song.destroy!
      flash[:notice] = "Canção #{song.name} apagada com sucesso!"
    rescue => err
      flash[:notice] = err
    ensure
      unless request.referrer == object_url
        redirect_back(fallback_location: songs_path) and return
      else
        redirect_to songs_path
      end
    end
  end

  private

  def songs_params
    params.require('song').permit(:name, :is_explicit, :genre_id, :album_id)
  end

end
