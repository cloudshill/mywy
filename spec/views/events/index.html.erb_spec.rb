require 'spec_helper'

describe "events/index" do
  before(:each) do
    assign(:events, [
      stub_model(Event,
        :body => "MyText",
        :eventable_type => "Eventable Type",
        :eventable_id => 1,
        :member_id => 2
      ),
      stub_model(Event,
        :body => "MyText",
        :eventable_type => "Eventable Type",
        :eventable_id => 1,
        :member_id => 2
      )
    ])
  end

  it "renders a list of events" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Eventable Type".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
