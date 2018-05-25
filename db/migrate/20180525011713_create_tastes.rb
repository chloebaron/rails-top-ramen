class CreateTastes < ActiveRecord::Migration[5.2]
  def change
    create_table :tastes do |t|
      t.references :user, foreign_key: true
      t.references :portion, foreign_key: true

      t.timestamps
    end
  end
end
