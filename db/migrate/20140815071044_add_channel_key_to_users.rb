class AddChannelKeyToUsers < ActiveRecord::Migration
  def change
    add_column :users, :channel_key, :string
  end
end
