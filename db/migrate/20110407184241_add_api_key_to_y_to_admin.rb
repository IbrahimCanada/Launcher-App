class AddApiKeyToYToAdmin < ActiveRecord::Migration
  def self.up
    add_column :admins, :api_key, :string
  end

  def self.down
    remove_column :admins, :api_key
  end
end
