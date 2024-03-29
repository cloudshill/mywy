require 'spec_helper'

describe "events/edit" do
  before(:each) do
    @event = assign(:event, stub_model(Event,
      :body => "MyText",
      :eventable_type => "MyString",
      :eventable_id => 1,
      :member_id => 1
    ))
  end

  it "renders the edit event form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => events_path(@event), :method => "post" do
      assert_select "textarea#event_body", :name => "event[body]"
      assert_select "input#event_eventable_type", :name => "event[eventable_type]"
      assert_select "input#event_eventable_id", :name => "event[eventable_id]"
      assert_select "input#event_member_id", :name => "event[member_id]"
    end
  end
end
