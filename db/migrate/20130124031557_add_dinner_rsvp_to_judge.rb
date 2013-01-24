class AddDinnerRsvpToJudge < ActiveRecord::Migration
  def change
    add_column :judges, :attending_dinner, :boolean
  end
end
