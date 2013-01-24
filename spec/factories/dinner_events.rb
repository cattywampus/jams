# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :dinner_event do
    venue "Fancy Hotel"
    room "Dining Room"
    street1 "123 Main St"
    street2 ""
    city "Metropolis"
    state "VA"
    zip "12345"
    begins_at "2013-03-14 18:30:00"
    ends_at "2013-03-14 20:00:00"
    event

    factory :invalid_dinner_event do
      venue ""
    end
  end
end
