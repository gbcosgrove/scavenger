# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    first_name                "First"
    last_name                 "Last"
    sequence(:email)          { |n| "user#{n}@scavenger.com" }
    password                  "testpassword1"
    password_confirmation     "testpassword1"
  end
end
