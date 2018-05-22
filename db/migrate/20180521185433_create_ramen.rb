class CreateRamen < ActiveRecord::Migration[5.2]
  def change
    create_table :ramens do |t|
      t.string :name
      t.text :description
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
