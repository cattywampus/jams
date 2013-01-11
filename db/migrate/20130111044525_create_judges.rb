class CreateJudges < ActiveRecord::Migration
  def change
    create_table :judges do |t|
      t.references :person
      t.references :event
      t.string :status
      t.string :role
      t.text :biography
      t.boolean :rookie
      t.boolean :needs_shirt
      t.boolean :completed_vims
      t.boolean :provided_consent
      t.boolean :provided_conflict
      t.boolean :received_event_info

      t.timestamps
    end
    add_index :judges, :person_id
    add_index :judges, :event_id
  end
end
