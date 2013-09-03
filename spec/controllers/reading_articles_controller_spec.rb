require 'spec_helper'

describe ReadingArticlesController do

  describe "GET 'read'" do
    it "returns http success" do
      get 'read'
      response.should be_success
    end
  end

  describe "GET 'like'" do
    it "returns http success" do
      get 'like'
      response.should be_success
    end
  end

end
