require 'spec_helper'

describe "trailers/index" do
  before(:each) do
    assign(:trailers, [
      stub_model(Trailer,
        :url => "Url",
        :movie_id => 1
      ),
      stub_model(Trailer,
        :url => "Url",
        :movie_id => 1
      )
    ])
  end

  it "renders a list of trailers" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Url".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
