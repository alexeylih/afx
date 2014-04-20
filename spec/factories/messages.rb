# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :message do
    sender_id 1
    reciever_id 1
    message_text "MyText"
    read false
  end
end
