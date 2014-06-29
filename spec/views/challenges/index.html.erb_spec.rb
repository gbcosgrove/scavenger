require 'spec_helper'

describe "challenges/index" do
  before(:each) do
    assign(:challenges, [
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

  it "renders a list of challenges" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "ul.challenges li div", :text => "Title".to_s, :count => 2
    # assert_select "div.challenge p", :text => "MyText".to_s, :count => 2
  end
end
