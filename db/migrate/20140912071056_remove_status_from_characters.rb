class RemoveStatusFromCharacters < ActiveRecord::Migration
  def change
    remove_column :characters, :status, :text
  end
end
