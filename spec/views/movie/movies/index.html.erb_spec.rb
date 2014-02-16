require 'spec_helper'

describe "movie_movies/index" do
  before(:each) do
    assign(:movie_movies, [
      stub_model(Movie::Movie,
        :title => "Title",
        :original_title => "Original Title",
        :year => 1,
        :durations => "Durations",
        :summary => "Summary",
        :cover => "Cover"
      ),
      stub_model(Movie::Movie,
        :title => "Title",
        :original_title => "Original Title",
        :year => 1,
        :durations => "Durations",
        :summary => "Summary",
        :cover => "Cover"
      )
    ])
  end

  it "renders a list of movie_movies" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Original Title".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Durations".to_s, :count => 2
    assert_select "tr>td", :text => "Summary".to_s, :count => 2
    assert_select "tr>td", :text => "Cover".to_s, :count => 2
  end
end
