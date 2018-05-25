class Portion < ApplicationRecord
  belongs_to :ramen
  has_many :tastes
  validates :portion_spoonful, presence: :true
  validates :ramen_id, presence: :true
end
