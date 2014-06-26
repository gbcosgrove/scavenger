require 'spec_helper'

describe "Viewing challenge items" do
  let!(:challenge) { Challenge.create(title: "My challenge", description: "A new challenge")}
  it "displays no items when challenge is empty" do
    visit "/challenges"
    within "#challenge_#{challenge.id}" do
      click_link "List Items"
    end
    expect(page).to have_content("ChallengeItems#index")
  end

end
