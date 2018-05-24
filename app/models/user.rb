class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :ramens, dependent: :destroy
  has_many :favourites, dependent: :destroy
  has_many :fav_ramens, through: :favourites, source: :ramen
  has_many :reviews, dependent: :destroy
end
