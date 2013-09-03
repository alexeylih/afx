require 'spec_helper'

describe "balls/new" do
  before(:each) do
    assign(:ball, stub_model(Ball).as_new_record)
  end

  it "renders new ball form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", balls_path, "post" do
    end
  end
end
