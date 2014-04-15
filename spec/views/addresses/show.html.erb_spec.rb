require 'spec_helper'

describe "addresses/show" do
  before(:each) do
    @address = assign(:address, stub_model(Address,
      :addressee => "Addressee",
      :address => "Address",
      :mobile => "Mobile",
      :is_default => false,
      :member_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Addressee/)
    rendered.should match(/Address/)
    rendered.should match(/Mobile/)
    rendered.should match(/false/)
    rendered.should match(/1/)
  end
end
