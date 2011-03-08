class AddSignupsToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :signups, :integer, :default => 0
  end

  def self.down
    remove_column :users, :signups
  end
end
