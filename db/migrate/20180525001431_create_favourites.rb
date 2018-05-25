class CreateFavourites < ActiveRecord::Migration[5.2]
  def change
    create_table :favourites do |t|
      t.references :user, foreign_key: true
      t.references :ramen, foreign_key: true
      t.string :accepted, default: "Pending"

      t.timestamps
    end
  end
end
