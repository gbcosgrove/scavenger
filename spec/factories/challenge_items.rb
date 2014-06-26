# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :challenge_item do
    challenge nil
    content "MyString"
  end
end
