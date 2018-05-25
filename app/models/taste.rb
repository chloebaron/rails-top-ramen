class Taste < ApplicationRecord
  belongs_to :user
  belongs_to :portion
end
