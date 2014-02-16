require 'spec_helper'

describe "cinemas/index" do
  before(:each) do
    assign(:cinemas, [
      stub_model(Cinema,
        :name => "Name"
      ),
      stub_model(Cinema,
        :name => "Name"
      )
    ])
  end

  it "renders a list of cinemas" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
