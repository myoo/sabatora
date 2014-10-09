class CreateMaps < ActiveRecord::Migration
  def change
    create_table :maps do |t|
      t.string :title, null: false
      t.string :about
      t.text :description
      t.string :image, null: false
      t.integer :access, limit: 2, null: false
      t.references :user, index: true, null: false
      t.references :community, index: true

      t.timestamps
    end
  end
end
