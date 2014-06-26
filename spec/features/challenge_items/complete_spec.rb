require 'spec_helper'

describe "Editing challenge items" do
  let!(:challenge) { Challenge.create(title: "Create a brand new app", description: "Work a lot") }
  let!(:challenge_item) { challenge.challenge_items.create(content: "Never sleep") }

  it "is successful when marking a single item complete" do
    expect(challenge_item.completed_at).to be_nil
    visit_challenge challenge
    within dom_id_for(challenge_item) do
      click_link "Mark Complete"
    end
    challenge_item.reload
    expect(challenge_item.completed_at).to_not be_nil
  end
end
