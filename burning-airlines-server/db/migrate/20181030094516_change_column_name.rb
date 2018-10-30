class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :flights, :plane_id, :airplane_id
  end
end
