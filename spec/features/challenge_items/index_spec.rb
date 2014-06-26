require 'spec_helper'

describe "Viewing challenge items" do
  let!(:challenge) { Challenge.create(title: "My challenge", description: "A new challenge")}

  def visit_challenge(challenge)
    visit "/challenges"
    within "#challenge_#{challenge.id}" do
      click_link "List Items"
    end
  end

  it "displays the title of the challenge" do
    visit_challenge(challenge)
    within("h1") do
      expect(page).to have_content(challenge.title)
    end
  end

  it "displays no items when challenge is empty" do
    visit_challenge(challenge)
    expect(page.all("ul.challenge_items li").size).to eq(0)
  end

  it "displays item content when a challenge has items" do
    challenge.challenge_items.create(content: "Rock out all night long")
    challenge.challenge_items.create(content: "Sleep immediately afterwards")

    visit_challenge(challenge)

    expect(page.all("ul.challenge_items li").size).to eq(2)

    within "ul.challenge_items" do
      expect(page).to have_content("Rock out all night long")
      expect(page).to have_content("Sleep immediately afterwards")
    end
  end
end
