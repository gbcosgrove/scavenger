require 'spec_helper'

describe "Listing challenges" do
  it "requires login" do
    visit "/challenges"
    expect(page).to have_content("You must be logged in")
  end
end
