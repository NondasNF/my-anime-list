class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  has_many :favorite_animes
  has_many :favorites, through: :favorite_animes, source: :anime
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
