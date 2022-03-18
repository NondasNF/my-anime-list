class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  has_many :follow_animes
  has_many :followed, through: :follow_animes, source: :anime
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
