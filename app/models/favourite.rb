class Favourite < ApplicationRecord
  belongs_to :user
  belongs_to :ramen
  validates :user, uniqueness: { scope: :ramen }
end


