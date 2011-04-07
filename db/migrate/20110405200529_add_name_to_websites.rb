class AddNameToWebsites < ActiveRecord::Migration
  def self.up
  	add_column :websites, :domain_name, :string
  end

  def self.down
    remove_column :websites, :domain_name
  end
end
