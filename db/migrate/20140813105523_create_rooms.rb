class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.string :name
      t.string :about
      t.integer :owner_id, null: false
      t.integer :system_id, default: 0
      t.integer :community_id, null: false
      t.datetime :started_at
      t.datetime :finished_at

      t.foreign_key :communities

      t.timestamps
    end

    add_index :rooms, :owner_id
    add_index :rooms, :community_id
  end
end
