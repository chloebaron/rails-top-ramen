class AddAcceptedToTaste < ActiveRecord::Migration[5.2]
  def change
    add_column :tastes, :accepted, :boolean
  end
end
