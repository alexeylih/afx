# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :notification do
    type "MyText"
    recipient_id "MyString"
    arguments "MyText"
  end
end
