require 'spec_helper'

describe "employments/new" do
  before(:each) do
    assign(:employment, stub_model(Employment,
      :employmentable_id => 1,
      :employmentable_type => "MyString",
      :member_id => 1
    ).as_new_record)
  end

  it "renders new employment form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => employments_path, :method => "post" do
      assert_select "input#employment_employmentable_id", :name => "employment[employmentable_id]"
      assert_select "input#employment_employmentable_type", :name => "employment[employmentable_type]"
      assert_select "input#employment_member_id", :name => "employment[member_id]"
    end
  end
end
