class AddScenarioIdToRooms < ActiveRecord::Migration
  def change
    add_column :rooms, :scenario_id, :integer, references: :scenarios
    add_index :rooms, :scenario_id
  end
end
