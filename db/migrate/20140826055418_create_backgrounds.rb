class CreateBackgrounds < ActiveRecord::Migration
  def change
    create_table :backgrounds do |t|
      t.references :room, index: true
      t.string :image
      t.string :name
      t.text :about
      t.references :user, index: true
      t.integer :access
      t.references :community, index: true

      t.timestamps
    end
  end
end
