class CreateEntrees < ActiveRecord::Migration
  def change
    create_table :entrees do |t|
      t.references :dinner_event
      t.string :name
      t.text :description
      t.string :protein

      t.timestamps
    end
    add_index :entrees, :dinner_event_id
  end
end
