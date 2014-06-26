require 'spec_helper'

describe "Editing challenges" do
  let!(:challenge) { Challenge.create(title: "Create an app", description: "Write some code for the app")}

  def update_challenge(options={})
    options[:title] ||= "My challenge"
    options[:description] ||= "This is my challenge"
    challenge = options[:challenge]

    visit "/challenges"
    within "#challenge_#{challenge.id}" do
      click_link "Edit"
    end

    fill_in "Title", with: options[:title]
    fill_in "Description", with: options[:description]
    click_button "Update Challenge"
  end


  it "updates a challenge successfully with correct information" do
    update_challenge challenge: challenge,
                     title: "New challenge title",
                     description: "New challenge description"

    challenge.reload

    expect(page).to have_content("Challenge was successfully updated")
    expect(challenge.title).to eq("New challenge title")
    expect(challenge.description).to eq("New challenge description")
  end

  it "displays an error with no title" do
    update_challenge challenge: challenge, title: ""
    title = challenge.title
    challenge.reload
    expect(challenge.title).to eq(title)
    expect(page).to have_content("error")
  end

  it "displays an error with too short a title" do
    update_challenge challenge: challenge, title: "Test"
    expect(page).to have_content("error")
  end


  it "displays an error with no description" do
    update_challenge challenge: challenge, description: ""
    expect(page).to have_content("error")
  end

  it "displays an error with too short a description" do
    update_challenge challenge: challenge, description: "Test"
    expect(page).to have_content("error")
  end
end
