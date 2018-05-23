class AddAcceptedToFavourites < ActiveRecord::Migration[5.2]
  def change
    add_column :favourites, :accepted, :string, default: "Pending"
  end
end
