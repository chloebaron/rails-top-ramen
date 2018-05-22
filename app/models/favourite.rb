class Favourite < ApplicationRecord
  belongs_to :user
  belongs_to :ramen
  # I found out we can create duplicate fac record with same user and same ramen
  # so we have to add a validation for unique pair of ramen and user
  validates :user, uniqueness: { scope: :ramen }
end
