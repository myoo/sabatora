class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :avatar
      t.text :introduction
      t.integer :sex, limit: 1
      t.date :birth, null: false
      t.references :user, index: true, null: false

      t.timestamps
    end
  end
end
