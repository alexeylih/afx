require 'faker' 

FactoryGirl.define do 

	factory :feed do 
		title Faker::Lorem.sentence(word_count = 4, supplemental = false, random_words_to_add = 6)
	 	url Faker::Internet.url
	end 

end 
