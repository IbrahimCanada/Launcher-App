class AddConfirmationToUsers < ActiveRecord::Migration
  def self.up
  	add_column :users, :confirmation_code, :string
  	add_column :users, :confirmed, :boolean, :default => false
  	add_column :users, :referrer_id, :integer
  end

  def self.down
  	remove_column :users, :confirmation_code
  	remove_column :users, :confirmed
  	remove_column :users, :referrer_id
  end
end
