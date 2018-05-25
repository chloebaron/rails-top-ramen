class CreateRamens < ActiveRecord::Migration[5.2]
  def change
    create_table :ramens do |t|
      t.string :name
      t.string :description
      t.references :user, foreign_key: true
      t.integer :portions
      t.integer :price_per_portion

      t.timestamps
    end
  end
end
