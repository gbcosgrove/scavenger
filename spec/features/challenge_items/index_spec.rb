require 'spec_helper'

describe "Viewing challenge items" do
  let!(:challenge) { Challenge.create(title: "Create an App", description: "Test the App") }

  it "displays the title of the challenge" do
    visit_challenge(challenge)
    within("div.content h1") do
      expect(page).to have_content(challenge.title)
    end
  end

  it "displays no items when a challenge is empty" do
    visit_challenge(challenge)
    expect(page.all("table.challenge_items tbody tr").size).to eq(0)
  end

  it "displays item content when a challenge has items" do
    challenge.challenge_items.create(content: "Never Sleep")
    challenge.challenge_items.create(content: "Work all the time")

    visit_challenge(challenge)

    expect(page.all("table.challenge_items tbody tr").size).to eq(2)

    within "table.challenge_items" do
      expect(page).to have_content("Never Sleep")
      expect(page).to have_content("Work all the time")
    end
  end
end
