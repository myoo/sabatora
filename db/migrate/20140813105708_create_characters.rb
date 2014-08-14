class CreateCharacters < ActiveRecord::Migration
  def change
    create_table :characters do |t|
      t.references :user, index: true
      t.string :name
      t.string :about
      t.integer :system_id

      t.timestamps
    end
  end
end
