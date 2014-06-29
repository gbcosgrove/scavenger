require 'spec_helper'

describe "Deleting challenge items" do
  let(:user) { challenge.user }
  let!(:challenge) { create(:challenge) }
  let!(:challenge_item) { challenge.challenge_items.create(content: "Never Sleep") }
  before { sign_in user, password: 'testpassword1'}

  it "is successful" do
    pending "Adding delete link"
    visit_challenge(challenge)
    within "#challenge_item_#{challenge_item.id}" do
      click_link "Delete"
    end
    expect(page).to have_content("Challenge item was deleted.")
    expect(ChallengeItem.count).to eq(0)
  end
end
