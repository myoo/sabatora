class AddHeadersToCommunities < ActiveRecord::Migration
  def change
    add_column :communities, :header, :string
    add_column :communities, :icon, :string
  end
end
