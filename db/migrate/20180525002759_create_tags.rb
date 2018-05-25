class CreateTags < ActiveRecord::Migration[5.2]
  def change
    create_table :tags do |t|
      t.references :ramen, foreign_key: true
      t.string :category

      t.timestamps
    end
  end
end
