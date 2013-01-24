class CreateAttendees < ActiveRecord::Migration
  def change
    create_table :attendees do |t|
      t.references :person
      t.references :dinner_event

      t.timestamps
    end
    add_index :attendees, :person_id
    add_index :attendees, :dinner_event_id
  end
end
