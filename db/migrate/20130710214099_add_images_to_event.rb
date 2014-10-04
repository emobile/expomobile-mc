class AddImagesToEvent < ActiveRecord::Migration
  def self.up
    add_column :events, :logo_file_name, :string
    add_column :events, :logo_content_type, :string
    add_column :events, :logo_file_size, :integer
    add_column :events, :logo_updated_at, :datetime
    add_column :events, :banner_file_name, :string
    add_column :events, :banner_content_type, :string
    add_column :events, :banner_file_size, :integer
    add_column :events, :banner_updated_at, :datetime
    add_column :events, :logo_bellow_file_name, :string
    add_column :events, :logo_bellow_content_type, :string
    add_column :events, :logo_bellow_file_size, :integer
    add_column :events, :logo_bellow_updated_at, :datetime
    add_column :events, :map_file_name, :string
    add_column :events, :map_content_type, :string
    add_column :events, :map_file_size, :integer
    add_column :events, :map_updated_at, :datetime
  end

  def self.down
    remove_column :events, :logo_file_name
    remove_column :events, :logo_content_type
    remove_column :events, :logo_file_size
    remove_column :events, :logo_updated_at
    remove_column :events, :banner_file_name
    remove_column :events, :banner_content_type
    remove_column :events, :banner_file_size
    remove_column :events, :banner_updated_at
    remove_column :events, :map_file_name
    remove_column :events, :map_content_type
    remove_column :events, :map_file_size
    remove_column :events, :map_updated_at
    remove_column :events, :logo_bellow_file_name
    remove_column :events, :logo_bellow_content_type
    remove_column :events, :logo_bellow_file_size
    remove_column :events, :logo_bellow_updated_at
  end
end