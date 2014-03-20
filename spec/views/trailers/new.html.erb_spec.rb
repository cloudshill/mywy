require 'spec_helper'

describe "trailers/new" do
  before(:each) do
    assign(:trailer, stub_model(Trailer,
      :url => "MyString",
      :movie_id => 1
    ).as_new_record)
  end

  it "renders new trailer form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => trailers_path, :method => "post" do
      assert_select "input#trailer_url", :name => "trailer[url]"
      assert_select "input#trailer_movie_id", :name => "trailer[movie_id]"
    end
  end
end
