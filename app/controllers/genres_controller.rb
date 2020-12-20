class GenresController < ApplicationController
  before_action :authenticate_user!

  def index
    @genres = Genre.all
  end

  def new
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      redirect_to genres_path
    else
      render :new
    end
  end

  def destroy
  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end

end
