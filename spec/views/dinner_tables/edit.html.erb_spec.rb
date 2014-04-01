require 'spec_helper'

describe "dinner_tables/edit" do
  before(:each) do
    @dinner_table = assign(:dinner_table, stub_model(DinnerTable,
      :name => "MyString",
      :restaurant_id => 1
    ))
  end

  it "renders the edit dinner_table form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => dinner_tables_path(@dinner_table), :method => "post" do
      assert_select "input#dinner_table_name", :name => "dinner_table[name]"
      assert_select "input#dinner_table_restaurant_id", :name => "dinner_table[restaurant_id]"
    end
  end
end
