class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.references :person
      t.string :address_type
      t.string :street1
      t.string :street2
      t.string :city
      t.string :state
      t.string :zip
      t.boolean :primary

      t.timestamps
    end
    add_index :addresses, :person_id
  end
end
