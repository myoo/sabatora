class AddParamatersToCharacters < ActiveRecord::Migration
  def change
    add_column :characters, :paramaters, :text
  end
end
