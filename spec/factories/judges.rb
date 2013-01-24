# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :judge do
    person
    event
    status "confirmed"
    role "judge"
    biography "At vero eos et accusam"
    rookie false
    needs_shirt false
    completed_vims false
    provided_consent false
    provided_conflict false
    received_event_info false
    attending_dinner true
  end
end
