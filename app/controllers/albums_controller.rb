class AlbumsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @albums = Album.all
  end

  def new
    @album = Album.new
  end

  def create
    @album = current_user.albums.new(album_params)

    if @album.save
      redirect_to @album, notice: '相簿新增成功'
    else
      render :new
    end
  end

  private

  def album_params
    params.require(:album).permit(:name, :description, :password, :online)
  end
end
