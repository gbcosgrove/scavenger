require 'spec_helper'

describe "Deleting challenges" do
  let(:user) { challenge.user }
  let!(:challenge) { create(:challenge) }

  before do
    sign_in user, password: "testpassword1"
  end

  it "is successful when clicking the destroy link" do
    pending "Adding delete destroy link"
    visit "/challenges"

    within "#challenge_#{challenge.id}" do
      click_link "Destroy"
    end
    expect(page).to_not have_content(challenge.title)
    expect(Challenge.count).to eq(0)
  end
end
