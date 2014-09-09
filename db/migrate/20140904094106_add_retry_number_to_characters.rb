class AddRetryNumberToCharacters < ActiveRecord::Migration
  def change
    add_column :characters, :retry_number, :integer
  end
end
