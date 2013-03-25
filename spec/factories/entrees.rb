# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :entree do
    dinner_event nil
    name "MyString"
    description "MyText"
    protein "MyString"
  end
end
