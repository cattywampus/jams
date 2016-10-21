class AddFeedbackFieldsToJudge < ActiveRecord::Migration[5.0]
  def change
    add_column :judges, :blacklisted, :boolean
    add_column :judges, :potential_judge_advisor, :boolean
    add_column :judges, :invite_to_championship, :boolean
    add_column :judges, :rating, :integer
  end
end
