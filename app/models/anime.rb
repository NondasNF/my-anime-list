class Anime < ApplicationRecord
  has_many :follow_animes
  has_many :followd_by, through: :follow_animes, source: :user
end
