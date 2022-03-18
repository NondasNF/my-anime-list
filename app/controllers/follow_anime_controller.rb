class FollowAnimeController < ApplicationController
  def index
    @followed = current_user.followed
  end
end
