class AddClicksToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :clicks, :integer, :default => 0
  end

  def self.down
    remove_column :users, :clicks
  end
end
