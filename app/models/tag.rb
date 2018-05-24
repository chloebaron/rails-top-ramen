class Tag < ApplicationRecord
  belongs_to :ramen
  belongs_to :category
  validates :category, uniqueness: { scope: :ramen}
end
