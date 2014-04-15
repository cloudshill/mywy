require 'spec_helper'

describe "addresses/index" do
  before(:each) do
    assign(:addresses, [
      stub_model(Address,
        :addressee => "Addressee",
        :address => "Address",
        :mobile => "Mobile",
        :is_default => false,
        :member_id => 1
      ),
      stub_model(Address,
        :addressee => "Addressee",
        :address => "Address",
        :mobile => "Mobile",
        :is_default => false,
        :member_id => 1
      )
    ])
  end

  it "renders a list of addresses" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Addressee".to_s, :count => 2
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    assert_select "tr>td", :text => "Mobile".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
