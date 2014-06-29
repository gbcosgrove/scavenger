require 'spec_helper'

describe "Editing challenge items" do
  let(:user) { challenge.user }
  let!(:challenge) { create(:challenge) }
  let!(:challenge_item) { challenge.challenge_items.create(content: "Never Sleep") }
  before { sign_in user, password: 'testpassword1'}

  it "is successful with valid content" do
    visit_challenge(challenge)
    within("#challenge_item_#{challenge_item.id}") do
      click_link challenge_item.content
    end
    fill_in "Content", with: "Lots of Sleep"
    click_button "Save"
    expect(page).to have_content("Saved challenge item.")
    challenge_item.reload
    expect(challenge_item.content).to eq("Lots of Sleep")
  end

  it "is unsuccessful with no content" do
    visit_challenge(challenge)
    within("#challenge_item_#{challenge_item.id}") do
      click_link challenge_item.content
    end
    fill_in "Content", with: ""
    click_button "Save"
    expect(page).to_not have_content("Saved challenge item.")
    expect(page).to have_content("Content can't be blank")
    challenge_item.reload
    expect(challenge_item.content).to eq("Never Sleep")
  end

  it "is unsuccessful with not enough content" do
    visit_challenge(challenge)
    within("#challenge_item_#{challenge_item.id}") do
      click_link challenge_item.content
    end
    fill_in "Content", with: "1"
    click_button "Save"
    expect(page).to_not have_content("Saved challenge item.")
    expect(page).to have_content("Content is too short")
    challenge_item.reload
    expect(challenge_item.content).to eq("Never Sleep")
  end



end
