require 'spec_helper'

describe "Editing challenges" do
  let(:user) { challenge.user }
  let!(:challenge) { create(:challenge) }

  def update_challenge(options={})
    options[:title] ||= "My challenge"
    options[:description] ||= "This is my challenge."
    challenge = options[:challenge]

    visit "/challenges"
    within "#challenge_#{challenge.id}" do
      click_link "Edit"
    end

    fill_in "Title", with: options[:title]
    fill_in "Description", with: options[:description]
    click_button "Update Challenge"
  end

  before do
    sign_in challenge.user, password: "testpassword1"
  end

  it "updates a challenge successfully with correct information" do
    pending "Adding update methods"
    update_challenge challenge: challenge,
                     title: "New title",
                     description: "New description"

    challenge.reload

    expect(page).to have_content("Challenge was successfully updated")
    expect(challenge.title).to eq("New title")
    expect(challenge.description).to eq("New description")
  end

  it "displays an error with no title" do
    pending "Adding update methods"
    update_challenge challenge: challenge, title: ""
    title = challenge.title
    challenge.reload
    expect(challenge.title).to eq(title)
    expect(page).to have_content("error")
  end

  it "displays an error with too short a title" do
    pending "Adding update methods"
    update_challenge challenge: challenge, title: "hi"
    expect(page).to have_content("error")
  end

  it "displays an error with no description" do
    pending "Adding update methods"
    update_challenge challenge: challenge, description: ""
    expect(page).to have_content("error")
  end

  it "displays an error with too short a description" do
    pending "Adding update methods"
    update_challenge challenge: challenge, description: "hi"
    expect(page).to have_content("error")
  end
end
