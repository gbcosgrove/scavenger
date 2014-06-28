require 'spec_helper'

describe "Deleting challenges" do
  let(:user) { create(:user) }
  let!(:challenge) { Challenge.create(title: "Create an App", description: "Test the App.") }

  before do
    sign_in user, password: "password123"
  end

  it "is successful when clicking the destroy link" do
    visit "/challenges"

    within "#challenge_#{challenge.id}" do
      click_link "Destroy"
    end
    expect(page).to_not have_content(challenge.title)
    expect(Challenge.count).to eq(0)
  end
end
