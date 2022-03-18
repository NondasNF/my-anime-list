class FavoriteAnimeController < ApplicationController
  def index
    @favorites = current_user.favorites
  end
end
