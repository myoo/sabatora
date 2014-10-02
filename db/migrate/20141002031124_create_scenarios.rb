class CreateScenarios < ActiveRecord::Migration
  def change
    create_table :scenarios do |t|
      t.references :community, index: true, nil: false
      t.references :user, index: true, nil: false
      t.integer :access, limit: 2
      t.string :name
      t.string :about
      t.text :description

      t.timestamps
    end
  end
end
