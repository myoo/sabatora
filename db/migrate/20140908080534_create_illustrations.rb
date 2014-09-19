class CreateIllustrations < ActiveRecord::Migration
  def change
    create_table :illustrations do |t|
      t.references :user, index: true
      t.integer :access, default: 2
      t.string :name, null: false
      t.text :description
      t.string :image, null: false

      t.timestamps
    end

    create_table :characters_illustrations, id: false do |t|
      t.belongs_to :character
      t.belongs_to :illustration
    end
  end
end
