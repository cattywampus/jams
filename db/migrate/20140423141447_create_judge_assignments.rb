class CreateJudgeAssignments < ActiveRecord::Migration
  def change
    create_table :judge_assignments do |t|
      t.references :judge_team
      t.references :judge

      t.timestamps
    end
    add_index :judge_assignments, :judge_team_id
    add_index :judge_assignments, :judge_id
  end
end
