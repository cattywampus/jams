# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :game do
    name "Stack Attack"
    season "2003"
    logo "stack_attack.jpg"
    program
  end

  factory :invalid_game, parent: :game do
    name ""
  end
end
