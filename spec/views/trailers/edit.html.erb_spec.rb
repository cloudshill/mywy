require 'spec_helper'

describe "trailers/edit" do
  before(:each) do
    @trailer = assign(:trailer, stub_model(Trailer,
      :url => "MyString",
      :movie_id => 1
    ))
  end

  it "renders the edit trailer form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => trailers_path(@trailer), :method => "post" do
      assert_select "input#trailer_url", :name => "trailer[url]"
      assert_select "input#trailer_movie_id", :name => "trailer[movie_id]"
    end
  end
end
