require 'spec_helper'

describe "events/show" do
  before(:each) do
    @event = assign(:event, stub_model(Event,
      :body => "MyText",
      :eventable_type => "Eventable Type",
      :eventable_id => 1,
      :member_id => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    rendered.should match(/Eventable Type/)
    rendered.should match(/1/)
    rendered.should match(/2/)
  end
end
