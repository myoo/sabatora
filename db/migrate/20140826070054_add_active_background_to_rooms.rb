class AddActiveBackgroundToRooms < ActiveRecord::Migration
  def change
    add_column :rooms, :active_background_id, :integer
  end
end
