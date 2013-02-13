class CreatePhoneNumbers < ActiveRecord::Migration
  def change
    create_table :phone_numbers do |t|
      t.references :person
      t.string :phone_type
      t.string :phone_number
      t.boolean :primary

      t.timestamps
    end
    add_index :phone_numbers, :person_id
  end
end
