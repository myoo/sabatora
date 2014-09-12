class AddMemosToCharacters < ActiveRecord::Migration
  def change
    add_column :characters, :profile, :text
    add_column :characters, :memo, :text
    add_column :characters, :status, :text
  end
end
