# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :program do
    name "FIRST Robotics Competition"
    abbr "FRC"
    logo ""
    icon ""
  end

  factory :invalid_program, parent: :program do |f|
    f.name nil
  end
end
