require 'spec_helper'
require 'factory_girl_rails'

describe ReadingArticle do
	it "test 1 1 1 " do
		a = FactoryGirl.build(:feed)
		expect(a).to eq 'a'
	end
end





