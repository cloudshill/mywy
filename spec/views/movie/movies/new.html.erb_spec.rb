require 'spec_helper'

describe "movie_movies/new" do
  before(:each) do
    assign(:movie, stub_model(Movie::Movie,
      :title => "MyString",
      :original_title => "MyString",
      :year => 1,
      :durations => "MyString",
      :summary => "MyString",
      :cover => "MyString"
    ).as_new_record)
  end

  it "renders new movie form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => movie_movies_path, :method => "post" do
      assert_select "input#movie_title", :name => "movie[title]"
      assert_select "input#movie_original_title", :name => "movie[original_title]"
      assert_select "input#movie_year", :name => "movie[year]"
      assert_select "input#movie_durations", :name => "movie[durations]"
      assert_select "input#movie_summary", :name => "movie[summary]"
      assert_select "input#movie_cover", :name => "movie[cover]"
    end
  end
end
