class Ramen < ApplicationRecord
  belongs_to :user
  has_many :favourites, dependent: :destroy
  has_many :users, through: :favourites
  has_many :reviews, dependent: :destroy
  has_many :tags, dependent: :destroy
  has_many :portions
  mount_uploader :photo, PhotoUploader

  # specify a ramen will have many users to fav it.
  # ramen.user will return the creator
  # ramen.users will give you fav users
  include PgSearch
  pg_search_scope :global_search,
    against: [ :name, :description ],
    associated_against: {
      tags: [ :category ]
    },
    using: {
      tsearch: { prefix: true }
    }

  # pg_search_scope :search_by_tag,
  #   associated_against: {
  #     tags: [ :category ]
  #   },
  #   using: {
  #     tsearch: { prefix: true }
  #   }
end
