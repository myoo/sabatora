class CreateMapLists < ActiveRecord::Migration
  def change
    create_table :map_lists do |t|
      t.references :map, index: true, null: false
      t.references :scenario, index: true, null: false
      t.integer :order_no
      t.text :comment, limit: 500

      t.timestamps
    end
  end
end
