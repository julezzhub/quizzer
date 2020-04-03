class ChangeDefaultForRoom < ActiveRecord::Migration[5.2]
  def change
    change_column_default :rooms, :capacity, 6
  end
end
