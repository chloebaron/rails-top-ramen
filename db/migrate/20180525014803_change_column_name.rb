class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :ramens, :portions, :portions_left
  end
end
