require 'spec_helper'

describe "Deleting challenges" do
  let!(:challenge) { Challenge.create(title: "New challenge", description: "Another challenge") }

  it "is successful when clicking the destroy link" do
    visit "/challenges"

    within "#challenge_#{challenge.id}" do
      click_link "Destroy"
    end
    expect(page).to_not have_content(challenge.title)
    expect(Challenge.count).to eq(0)
  end
end
