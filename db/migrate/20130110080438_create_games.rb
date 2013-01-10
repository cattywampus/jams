class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :name
      t.string :season
      t.string :logo
      t.references :program

      t.timestamps
    end
    add_index :games, :program_id
  end
end
