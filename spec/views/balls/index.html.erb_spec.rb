require 'spec_helper'

describe "balls/index" do
  before(:each) do
    assign(:balls, [
      stub_model(Ball),
      stub_model(Ball)
    ])
  end

  it "renders a list of balls" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
