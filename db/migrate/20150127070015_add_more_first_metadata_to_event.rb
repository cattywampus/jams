class AddMoreFirstMetadataToEvent < ActiveRecord::Migration
  def change
    add_column :events, :address, :string
    add_column :events, :first_event_id, :integer
    
    remove_column :events, :first_event_details_url
    remove_column :events, :first_teamlist_url
    
    add_index :events, :first_event_id, unique: true
  end
end
