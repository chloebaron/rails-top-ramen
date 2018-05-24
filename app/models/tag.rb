class Tag < ApplicationRecord
  belongs_to :ramen
  validates :category, presence: true, uniqueness: true
end
