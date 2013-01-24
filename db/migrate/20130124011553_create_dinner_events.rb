class CreateDinnerEvents < ActiveRecord::Migration
  def change
    create_table :dinner_events do |t|
      t.string :venue
      t.string :room
      t.string :street1
      t.string :street2
      t.string :city
      t.string :state
      t.string :zip
      t.datetime :begins_at
      t.datetime :ends_at
      t.references :event

      t.timestamps
    end
    add_index :dinner_events, :event_id
  end
end
