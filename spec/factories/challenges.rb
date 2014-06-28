# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :challenge do
    title "Challenge Title"
    description "Challenge Description"
    user
  end
end
