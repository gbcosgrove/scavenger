require 'spec_helper'

describe "Adding challenge items" do
  let!(:challenge) { Challenge.create(title: "My challenge", description: "A new challenge")}



  it "is successful with valid content" do
    visit_challenge(challenge)
    click_link "New Challenge Item"
    fill_in "Content", with: "Write more RSpec tests"
    click_button "Save"
    expect(page).to have_content("Added challenge item")
    within("table.challenge_items") do
      expect(page).to have_content("Write more RSpec tests")
    end
  end

  it "displays an error with no content" do
    visit_challenge(challenge)
    click_link "New Challenge Item"
    fill_in "Content", with: ""
    click_button "Save"
    within("div.flash") do
      expect(page).to have_content("There was an error adding that challenge item")
    end
    expect(page).to have_content("Content can't be blank")
  end

  it "displays an error with content less than 3 characters long" do
    visit_challenge(challenge)
    click_link "New Challenge Item"
    fill_in "Content", with: "Hi"
    click_button "Save"
    within("div.flash") do
      expect(page).to have_content("There was an error adding that challenge item")
    end
    expect(page).to have_content("Content is too short")
  end

end
