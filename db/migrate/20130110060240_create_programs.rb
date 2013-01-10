class CreatePrograms < ActiveRecord::Migration
  def change
    create_table :programs do |t|
      t.string :name
      t.string :abbr
      t.string :logo
      t.string :icon

      t.timestamps
    end
  end
end
