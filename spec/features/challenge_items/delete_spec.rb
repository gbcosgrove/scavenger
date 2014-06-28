require 'spec_helper'

describe "Deleting challenge items" do
  let!(:challenge) { Challenge.create(title: "Create an App", description: "Test the App") }
  let!(:challenge_item) { challenge.challenge_items.create(content: "Never Sleep") }
  let(:user) { create(:user) }
  before { sign_in user, password: 'password123'}

  it "is successful" do
    visit_challenge(challenge)
    within "#challenge_item_#{challenge_item.id}" do
      click_link "Delete"
    end
    expect(page).to have_content("Challenge item was deleted.")
    expect(ChallengeItem.count).to eq(0)
  end
end
