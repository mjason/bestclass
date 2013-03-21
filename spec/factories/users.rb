FactoryGirl.define do
  factory :user do
    sequence(:name){|n| "name#{n}" }
    sequence(:email){|n| "email#{n}@bestng.me" }
    password "123123123"
    password_confirmation "123123123"
  end
end