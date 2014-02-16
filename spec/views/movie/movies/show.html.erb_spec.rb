require 'spec_helper'

describe "movie_movies/show" do
  before(:each) do
    @movie = assign(:movie, stub_model(Movie::Movie,
      :title => "Title",
      :original_title => "Original Title",
      :year => 1,
      :durations => "Durations",
      :summary => "Summary",
      :cover => "Cover"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    rendered.should match(/Original Title/)
    rendered.should match(/1/)
    rendered.should match(/Durations/)
    rendered.should match(/Summary/)
    rendered.should match(/Cover/)
  end
end
