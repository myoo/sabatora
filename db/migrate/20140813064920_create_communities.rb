class CreateCommunities < ActiveRecord::Migration
  def change
    create_table :communities do |t|
      t.string :name
      t.text :about
      t.text :description

      t.timestamps
    end
  end
end
