require 'spec_helper'

describe "employments/index" do
  before(:each) do
    assign(:employments, [
      stub_model(Employment,
        :employmentable_id => 1,
        :employmentable_type => "Employmentable Type",
        :member_id => 2
      ),
      stub_model(Employment,
        :employmentable_id => 1,
        :employmentable_type => "Employmentable Type",
        :member_id => 2
      )
    ])
  end

  it "renders a list of employments" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Employmentable Type".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
