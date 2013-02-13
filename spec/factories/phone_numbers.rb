# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :phone_number do
    person nil
    type ""
    number "MyString"
    primary false
  end
end
