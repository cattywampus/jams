# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :event do
    game
    name "Virginia Regional"
    venue "VCU Siegel Center"
    street1 "MyString"
    street2 "MyString"
    city "MyString"
    state "MyString"
    zip "MyString"
    begins_on "2013-01-10"
    ends_on "2013-01-10"

    factory :invalid_event do
      name ""
    end
  end
end
