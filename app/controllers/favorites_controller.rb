class FavoritesController < ApplicationController
  def index
    @favorites = Favorite.all
    @animes_favorites = []
    @favorites.each do |favorite|
      @animes_favorites << Anime.find(favorite.anime_id)
    end
  end

  def new
    @favorite = Favorite.new
  end

  def create
    @favorite = Favorite.new(anime_id: favorite_params.id, user_id: current_user.id)
    logger.debug "Favorite should be valid: #{@favorite.valid?}"
    @favorite.save
  end

  def destroy
    @favorite.destroy
  end

  private
  def favorite_params
    params.require(:anime).permit(:id, :name, :gender, :classification)
  end
end
