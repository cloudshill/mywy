require 'spec_helper'

describe "addresses/edit" do
  before(:each) do
    @address = assign(:address, stub_model(Address,
      :addressee => "MyString",
      :address => "MyString",
      :mobile => "MyString",
      :is_default => false,
      :member_id => 1
    ))
  end

  it "renders the edit address form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => addresses_path(@address), :method => "post" do
      assert_select "input#address_addressee", :name => "address[addressee]"
      assert_select "input#address_address", :name => "address[address]"
      assert_select "input#address_mobile", :name => "address[mobile]"
      assert_select "input#address_is_default", :name => "address[is_default]"
      assert_select "input#address_member_id", :name => "address[member_id]"
    end
  end
end
