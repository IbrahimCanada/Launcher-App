class AddHeaderAndContentToWebsites < ActiveRecord::Migration
  def self.up
    add_column :websites, :header, :string
    add_column :websites, :content, :text
  end

  def self.down
    remove_column :websites, :content
    remove_column :websites, :header
  end
end
