class CreatePortions < ActiveRecord::Migration[5.2]
  def change
    create_table :portions do |t|
      t.references :ramen, foreign_key: true
      t.integer :portion_spoonful

      t.timestamps
    end
  end
end
