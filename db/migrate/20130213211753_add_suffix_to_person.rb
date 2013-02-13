class AddSuffixToPerson < ActiveRecord::Migration
  def change
    add_column :people, :suffix, :string
  end
end
