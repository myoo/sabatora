class CreatePlayerRoles < ActiveRecord::Migration
  def change
    create_table :player_roles do |t|
      t.string :name

      t.timestamps
    end
  end
end
