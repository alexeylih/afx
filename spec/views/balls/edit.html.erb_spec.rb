require 'spec_helper'

describe "balls/edit" do
  before(:each) do
    @ball = assign(:ball, stub_model(Ball))
  end

  it "renders the edit ball form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", ball_path(@ball), "post" do
    end
  end
end
