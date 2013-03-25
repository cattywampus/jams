class AddEntreeToAttendee < ActiveRecord::Migration
  def change
    add_column :attendees, :entree_id, :integer
  end
end
