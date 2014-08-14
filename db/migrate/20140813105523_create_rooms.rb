class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.string :name
      t.string :about
      t.integer :owner_id
      t.integer :system_id
      t.integer :community_id
      t.datetime :started_at
      t.datetime :finished_at

      t.timestamps
    end
  end
end
