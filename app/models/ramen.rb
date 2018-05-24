class Ramen < ApplicationRecord
  belongs_to :user
  has_many :favourites, dependent: :destroy
  has_many :users, through: :favourites
  has_many :reviews, dependent: :destroy
  has_many :tags, dependent: :destroy
  has_many :categories, through: :tags
  mount_uploader :photo, PhotoUploader

  # specify a ramen will have many users to fav it.
  # ramen.user will return the creator
  # ramen.users will give you fav users
end
