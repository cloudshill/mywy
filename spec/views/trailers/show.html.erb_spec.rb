require 'spec_helper'

describe "trailers/show" do
  before(:each) do
    @trailer = assign(:trailer, stub_model(Trailer,
      :url => "Url",
      :movie_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Url/)
    rendered.should match(/1/)
  end
end
