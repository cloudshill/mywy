require 'spec_helper'

describe "foods/edit" do
  before(:each) do
    @food = assign(:food, stub_model(Food,
      :name => "MyString",
      :price => "9.99",
      :sales => 1,
      :description => "MyString",
      :node_id => 1
    ))
  end

  it "renders the edit food form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => foods_path(@food), :method => "post" do
      assert_select "input#food_name", :name => "food[name]"
      assert_select "input#food_price", :name => "food[price]"
      assert_select "input#food_sales", :name => "food[sales]"
      assert_select "input#food_description", :name => "food[description]"
      assert_select "input#food_node_id", :name => "food[node_id]"
    end
  end
end
