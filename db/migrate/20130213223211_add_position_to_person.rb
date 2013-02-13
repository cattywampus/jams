class AddPositionToPerson < ActiveRecord::Migration
  def change
    rename_column :people, :title, :position
    add_column :people, :title, :string
  end
end
