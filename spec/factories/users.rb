# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name 'Test User'
    email 'example@example.com'
    password 'please'
    password_confirmation 'please'

    factory :admin do
      after(:create) { |u| u.add_role(:admin) }
    end

    factory :coordinator do
      after(:create) { |u| u.add_role(:coordinator) }
    end
  end
end
