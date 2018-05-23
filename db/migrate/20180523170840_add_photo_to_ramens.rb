class AddPhotoToRamens < ActiveRecord::Migration[5.2]
  def change
    add_column :ramens, :photo, :string
  end
end
