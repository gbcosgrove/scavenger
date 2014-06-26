require 'spec_helper'

describe "Editing challenge items" do
  let!(:challenge) { Challenge.create(title: "Create a brand new app", description: "Work a lot") }
  let!(:challenge_item) { challenge.challenge_items.create(content: "Never sleep") }

  def visit_challenge(list)
    visit "/challenges"
    within "#challenge_#{list.id}" do
      click_link "List Items"
    end
  end

  it "is successful with valid content" do
    visit_challenge(challenge)
    within("#challenge_item_#{challenge_item.id}") do
      click_link "Edit"
    end
    fill_in "Content", with: "Lots of no sleep"
    click_button "Save"
    expect(page).to have_content("Saved challenge item.")
    challenge_item.reload
    expect(challenge_item.content).to eq("Lots of no sleep")
  end

  it "is unsuccessful with no content" do
    visit_challenge(challenge)
    within("#challenge_item_#{challenge_item.id}") do
      click_link "Edit"
    end
    fill_in "Content", with: ""
    click_button "Save"
    expect(page).to_not have_content("Saved challenge item.")
    expect(page).to have_content("Content can't be blank")
    challenge_item.reload
    expect(challenge_item.content).to eq("Never sleep")
  end

  it "is unsuccessful with not enough content" do
    visit_challenge(challenge)
    within("#challenge_item_#{challenge_item.id}") do
      click_link "Edit"
    end
    fill_in "Content", with: "1"
    click_button "Save"
    expect(page).to_not have_content("Saved challenge item.")
    expect(page).to have_content("Content is too short")
    challenge_item.reload
    expect(challenge_item.content).to eq("Never sleep")
  end



end
