# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :relationship do
    obj_id 1
    subj_id 1
    type "MyText"
  end
end
