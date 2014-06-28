require 'spec_helper'

describe "Adding challenge items" do
  let!(:challenge) { Challenge.create(title: "Create an App", description: "Test the app") }
  let(:user) { create(:user) }
  before { sign_in user, password: 'password123'}

  it "is successful with valid content" do
    visit_challenge(challenge)
    click_link "New Challenge Item"
    fill_in "Content", with: "Always work"
    click_button "Save"
    expect(page).to have_content("Added challenge item.")
    within("table.challenge_items") do
      expect(page).to have_content("Always work")
    end
  end

  it "displays an error with no content" do
    visit_challenge(challenge)
    click_link "New Challenge Item"
    fill_in "Content", with: ""
    click_button "Save"
    within("div.flash") do
      expect(page).to have_content("There was a problem adding that challenge item.")
    end
    expect(page).to have_content("Content can't be blank")
  end

  it "displays an error with content less than 2 characters long" do
    visit_challenge(challenge)
    click_link "New Challenge Item"
    fill_in "Content", with: "1"
    click_button "Save"
    within("div.flash") do
      expect(page).to have_content("There was a problem adding that challenge item.")
    end
    expect(page).to have_content("Content is too short")
  end

end
