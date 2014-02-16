require 'spec_helper'

describe "cinemas/new" do
  before(:each) do
    assign(:cinema, stub_model(Cinema,
      :name => "MyString"
    ).as_new_record)
  end

  it "renders new cinema form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => cinemas_path, :method => "post" do
      assert_select "input#cinema_name", :name => "cinema[name]"
    end
  end
end
