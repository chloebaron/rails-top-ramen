class Ramen < ApplicationRecord
  belongs_to :user
  has_many :favourites
  has_many :users, through: :favourites

  # specify a ramen will have many users to fav it.
  # ramen.user will return the creator
  # ramen.users will give you fav users

end
