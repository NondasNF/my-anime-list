class Anime < ApplicationRecord
  has_many :favorite_animes
  has_many :favorited_by, through: :favorite_animes, source: :user
end
