class Favorite < ApplicationRecord
  belongs_to :user
  validates :anime_id, presence: true, uniqueness: { scope: :user_id }
end
