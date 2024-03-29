require 'spec_helper'

describe "employments/show" do
  before(:each) do
    @employment = assign(:employment, stub_model(Employment,
      :employmentable_id => 1,
      :employmentable_type => "Employmentable Type",
      :member_id => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/Employmentable Type/)
    rendered.should match(/2/)
  end
end
