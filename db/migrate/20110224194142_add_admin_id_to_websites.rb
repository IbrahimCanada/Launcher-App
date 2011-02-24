class AddAdminIdToWebsites < ActiveRecord::Migration
  def self.up
    add_column :websites, :admin_id, :integer
  end

  def self.down
    remove_column :websites, :admin_id
  end
end
