class CreateCharacterStatuses < ActiveRecord::Migration
  def change
    create_table :character_statuses do |t|
      t.references :illustration, index: true
      t.references :character, index: true
      t.references :room, index: true

      t.timestamps
    end
  end
end
