# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :person do
    first_name "John"
    middle_name ""
    last_name "Doe"
    email "user@acme.com"
    company "ACME Corp"
    title "Engineer"
    gender "male"
    shirt_size "l"

    factory :invalid_person do
      first_name ""
    end
  end
end
