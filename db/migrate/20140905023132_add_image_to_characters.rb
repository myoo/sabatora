class AddImageToCharacters < ActiveRecord::Migration
  def change
    add_column :characters, :image, :string
  end
end
