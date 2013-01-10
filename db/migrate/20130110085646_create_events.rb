class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.references :game
      t.string :name
      t.string :venue
      t.string :street1
      t.string :street2
      t.string :city
      t.string :state
      t.string :zip
      t.date :begins_on
      t.date :ends_on
      t.string :logo

      t.timestamps
    end
    add_index :events, :game_id
  end
end
