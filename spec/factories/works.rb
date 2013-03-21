# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :work do
    title "firt work"
    association :course
  end
end
