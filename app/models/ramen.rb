class Ramen < ApplicationRecord
  belongs_to :user
  has_many :favourites
  has_many :users, through: :favourites
end
