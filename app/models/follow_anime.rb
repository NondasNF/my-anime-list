class FollowAnime < ApplicationRecord
  validates :anime_id, uniqueness: { scope: :user_id }
  belongs_to :anime
  belongs_to :user
end
