class AddNameToWebsites < ActiveRecord::Migration
  def self.up
    add_column :websites, :name, :string
  end

  def self.down
    remove_column :websites, :name
  end
end
