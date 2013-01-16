class AddAssistantToPerson < ActiveRecord::Migration
  def change
    add_column :people, :assistant_id, :integer
  end
end
