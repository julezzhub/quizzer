class AddStatusToRoom < ActiveRecord::Migration[5.2]
  def change
    add_column :rooms, :inplay, :boolean, default: false
    add_column :users, :ready, :boolean, default: false
  end
end
