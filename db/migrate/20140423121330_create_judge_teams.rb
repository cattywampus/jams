class CreateJudgeTeams < ActiveRecord::Migration
  def change
    create_table :judge_teams do |t|
      t.references :event
      t.string :type

      t.timestamps
    end
    add_index :judge_teams, :event_id
  end
end
