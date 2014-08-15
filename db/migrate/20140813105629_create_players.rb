class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.references :user, index: true
      t.references :room
      t.references :player_role, index: true
      t.references :character, index: true

      t.timestamps
    end
  end
end
