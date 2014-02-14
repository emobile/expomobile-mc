class AddSocialNetworksToEvent < ActiveRecord::Migration
  def change
    add_column :events, :facebook, :string
    add_column :events, :twitter, :string
  end
end