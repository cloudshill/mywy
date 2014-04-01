require 'spec_helper'

describe "restaurants/index" do
  before(:each) do
    assign(:restaurants, [
      stub_model(Restaurant,
        :name => "Name",
        :avatar => "Avatar",
        :guide => "Guide",
        :member_id => 1
      ),
      stub_model(Restaurant,
        :name => "Name",
        :avatar => "Avatar",
        :guide => "Guide",
        :member_id => 1
      )
    ])
  end

  it "renders a list of restaurants" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Avatar".to_s, :count => 2
    assert_select "tr>td", :text => "Guide".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
