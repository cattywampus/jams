class AddFirstMetadataToEvent < ActiveRecord::Migration
  def change
    add_column :events, :event_type, :integer, default: 0
    add_column :events, :registered_teams, :integer, default: 0
    add_column :events, :open_capacity, :integer, default: 0
    add_column :events, :event_info_url, :string
    add_column :events, :first_event_details_url, :string
    add_column :events, :first_teamlist_url, :string
  end
end
