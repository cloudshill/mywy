require 'spec_helper'

describe "dinner_tables/new" do
  before(:each) do
    assign(:dinner_table, stub_model(DinnerTable,
      :name => "MyString",
      :restaurant_id => 1
    ).as_new_record)
  end

  it "renders new dinner_table form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => dinner_tables_path, :method => "post" do
      assert_select "input#dinner_table_name", :name => "dinner_table[name]"
      assert_select "input#dinner_table_restaurant_id", :name => "dinner_table[restaurant_id]"
    end
  end
end
