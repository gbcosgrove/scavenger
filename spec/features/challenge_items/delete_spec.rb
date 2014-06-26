require 'spec_helper'

describe "Deleting challenge items" do
  let!(:challenge) { Challenge.create(title: "Create a brand new app", description: "Work a lot") }
  let!(:challenge_item) { challenge.challenge_items.create(content: "Never sleep") }

  def visit_challenge(list)
    visit "/challenges"
    within "#challenge_#{list.id}" do
      click_link "List Items"
    end
  end

  it "is successful" do
    visit_challenge(challenge)
    within "#challenge_item_#{challenge_item.id}" do
      click_link "Delete"
    end

    expect(page).to have_content("Challenge item was deleted")
    expect(ChallengeItem.count).to eq(0)
  end
end
