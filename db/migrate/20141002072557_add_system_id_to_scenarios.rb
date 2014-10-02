class AddSystemIdToScenarios < ActiveRecord::Migration
  def change
    add_column :scenarios, :system_id, :integer, limit: 3
  end
end
