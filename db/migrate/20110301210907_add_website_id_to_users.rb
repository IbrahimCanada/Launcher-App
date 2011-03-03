class AddWebsiteIdToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :website_id, :integer
  end

  def self.down
    remove_column :users, :website_id
  end
end
