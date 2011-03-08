class AddInviteToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :invite, :boolean, :default => false
  end

  def self.down
    remove_column :users, :invite
  end
end
