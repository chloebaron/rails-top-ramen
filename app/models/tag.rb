class Tag < ApplicationRecord
  belongs_to :ramen
  validates :category, presence: true, uniqueness: { scope: :ramen }

  def self.categories
    all.map { |t| t.category }.uniq
  end
end
