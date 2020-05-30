class AlbumsController < ApplicationController

  def index
    @albums = Album.all
  end

  def create
    album = Album.new(albums_params)
    begin
      album.save!
      flash[:notice] = "Album #{album.name} criado com sucesso!"
      redirect_to album_path(album)
    rescue => err
      flash[:notice] = err
      redirect_to new_album_path
    end
  end

  def new
    @album = Album.new
  end

  def edit
    @album = Album.find(params[:id])
  end

  def show
    @album = Album.find(params[:id])
  end

  def update
    album = Album.find(params[:id])
    begin
      album.update!(albums_params)
      flash[:notice] = "Album #{album.name} modificado com sucesso!"
      redirect_to album_path(album)
    rescue => err
      flash[:notice] = err
      redirect_to edit_album_path
    end
  end

  def destroy
    album = Album.find(params[:id])
    begin
      album.destroy!
      flash[:notice] = "Album #{album.name} apagado com sucesso!"
    rescue => err
      flash[:notice] = err
    ensure
      redirect_to albums_path
    end
  end

  private

  def albums_params
    params.require('album').permit(:name, :artist)
  end

end
