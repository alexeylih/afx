require 'spec_helper'

describe "balls/show" do
  before(:each) do
    @ball = assign(:ball, stub_model(Ball))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
