require 'spec_helper'

describe "Adding challenge items" do
  let!(:challenge) { Challenge.create(title: "My challenge", description: "A new challenge")}

  def visit_challenge(challenge)
    visit "/challenges"
    within "#challenge_#{challenge.id}" do
      click_link "List Items"
    end
  end

  it "is successful with valid content" do
    visit_challenge(challenge)
    click_link "New Challenge Item"
    fill_in "Content", with: "Write more RSpec tests"
    click_button "Save"
    expect(page).to have_content("Added challenge item")
    within("ul.challenge_items") do
      expect(page).to have_content("Write more RSpec tests")
    end
  end


end
