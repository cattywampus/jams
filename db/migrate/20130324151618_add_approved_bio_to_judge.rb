class AddApprovedBioToJudge < ActiveRecord::Migration
  def change
    add_column :judges, :biography_approved, :boolean
  end
end
