class AddAttachmentBackgroundToWebsite < ActiveRecord::Migration
  def self.up
    add_column :websites, :background_file_name, :string
    add_column :websites, :background_content_type, :string
    add_column :websites, :background_file_size, :integer
    add_column :websites, :background_updated_at, :datetime
  end

  def self.down
    remove_column :websites, :background_file_name
    remove_column :websites, :background_content_type
    remove_column :websites, :background_file_size
    remove_column :websites, :background_updated_at
  end
end
