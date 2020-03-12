class Admins::GenresController < ApplicationController
  before_action :authenticate_admin!
  def index
    @all_genres = Genre.all
    @new_genre = Genre.new
  end
  def create
    new_genre = Genre.new(genre_params)
    new_genre.save
    redirect_to admins_genres_path
  end
  def update
    one_genre = Genre.find(params[:id])
    one_genre.update(genre_params)
    redirect_to admins_genres_path
  end
  def destroy
  end
  private
  def genre_params
    params.require(:genre).permit(:name, :valid_flag)
  end
end
