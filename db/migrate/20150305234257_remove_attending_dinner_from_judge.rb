class RemoveAttendingDinnerFromJudge < ActiveRecord::Migration
  def change
    remove_column :judges, :attending_dinner
  end
end
