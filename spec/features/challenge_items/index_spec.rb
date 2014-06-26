require 'spec_helper'

describe "Viewing challenge items" do
  let!(:challenge) { Challenge.create(title: "My challenge", description: "A new challenge")}


  xit "displays the title of the challenge" do
    visit_challenge(challenge)
    within("div.content h1") do
      expect(page).to have_content(challenge.title)
    end
  end

  it "displays no items when challenge is empty" do
    visit_challenge(challenge)
    expect(page.all("table.challenge_items tbody tr").size).to eq(0)
  end

  it "displays item content when a challenge has items" do
    challenge.challenge_items.create(content: "Rock out all night long")
    challenge.challenge_items.create(content: "Sleep immediately afterwards")

    visit_challenge(challenge)

    expect(page.all("table.challenge_items tbody tr").size).to eq(2)

    within "table.challenge_items" do
      expect(page).to have_content("Rock out all night long")
      expect(page).to have_content("Sleep immediately afterwards")
    end
  end
end
