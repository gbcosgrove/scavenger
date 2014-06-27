require 'spec_helper'

describe "chalenges/index" do
  before(:each) do
    assign(:chalenges, [
      stub_model(Challenge,
        :title => "Title",
        :description => "MyText"
      ),
      stub_model(Challenge,
        :title => "Title",
        :description => "MyText"
      )
    ])
  end

  it "renders a list of chalenges" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "div.chalenge h2", :text => "Title".to_s, :count => 2
    assert_select "div.chalenge p", :text => "MyText".to_s, :count => 2
  end
end
