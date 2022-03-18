class FollowAnimeController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @followed = current_user.followed
  end

  def favorites
    if current_user.follow_animes.where(favorite: true).any?
      favorited_ids = current_user.follow_animes.select(:anime_id).where(favorite: true).group(:anime_id)
      anime_ids = favorited_ids.sample['anime_id']
      @favorited = []
      @favorited << current_user.followed.find(anime_ids)
    end
  end
end
