class AlbumsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @albums = Album.order(position: :asc)
  end

  def show
    @album = Album.find(params[:id])
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

  def update
    @album = current_user.albums.find(params[:id])

    if @album.update(album_params)
      redirect_to @album, notice: '上傳成功'
    else
      redirect_to @album, alert: '上傳失敗'
    end
  end

  def sort
    @album = current_user.albums.find(params[:id])
    new_position = params[:position].to_i

    if @album.insert_at(new_position)
      render json: {}, status: :ok
    else
      render json: {}, status: 500
    end
  end

  private

  def album_params
    params.require(:album).permit(:name, :description, :password, :online, photos: [])
  end
end
