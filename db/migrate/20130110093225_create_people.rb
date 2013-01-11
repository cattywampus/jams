class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :email
      t.string :company
      t.string :title
      t.string :gender
      t.string :shirt_size

      t.timestamps
    end
  end
end
