require 'spec_helper'

describe "dinner_tables/show" do
  before(:each) do
    @dinner_table = assign(:dinner_table, stub_model(DinnerTable,
      :name => "Name",
      :restaurant_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/1/)
  end
end
