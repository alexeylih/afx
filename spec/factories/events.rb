# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :event do
    user_id 1
    r "MyString"
    verb "MyText"
    subject_id 1
    subject_type "MyText"
  end
end
