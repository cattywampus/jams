# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :judge_assignment do
    judge_team nil
    judge nil
  end
end
