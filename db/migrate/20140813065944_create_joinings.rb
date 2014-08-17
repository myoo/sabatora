class CreateJoinings < ActiveRecord::Migration
  def change
    create_table :joinings do |t|
      t.references :user, index: true
      t.references :community, index: true
      t.references :role, index: true
      t.text :comment

      t.timestamps
    end
  end
end
