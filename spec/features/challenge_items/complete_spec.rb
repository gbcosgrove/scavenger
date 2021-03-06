require 'spec_helper'

describe "Completing challenge items" do
  let(:user) { challenge.user }
  let!(:challenge) { create(:challenge) }
  let!(:challenge_item) { challenge.challenge_items.create(content: "Never Sleep") }
  before { sign_in user, password: 'testpassword1'}

  it "is successful when marking a single item complete" do
    expect(challenge_item.completed_at).to be_nil
    visit_challenge challenge
    within dom_id_for(challenge_item) do
      click_link "Mark Complete"
    end
    challenge_item.reload
    expect(challenge_item.completed_at).to_not be_nil
  end

  context "with completed items" do
    let!(:completed_challenge_item) { challenge.challenge_items.create(content: "Always work", completed_at: 5.minutes.ago) }

    it "shows completed items as complete and has option to mark incomplete" do
      visit_challenge challenge
      within dom_id_for(completed_challenge_item) do
        expect(page).to have_content(completed_challenge_item.completed_at.to_formatted_s(:long))
        expect(page).to have_content("Mark Incomplete")
      end
    end

    it "does not give the option to mark complete" do
      visit_challenge challenge
      within dom_id_for(completed_challenge_item) do
        expect(page).to_not have_content("Mark Complete")
      end
    end
  end
end
