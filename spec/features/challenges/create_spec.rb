require 'spec_helper'

describe "Creating challenges" do
  it "redirects to the challenge list index page on success" do
    visit "/challenges"
    click_link "New Challenge"
    expect(page).to have_content("New challenge")

    fill_in "Title", with: "Write some code"
    fill_in "Description", with: "Make the code really awesome"
    click_button "Create Challenge"

    expect(page).to have_content("Write some code")
  end

  it "displays an error when the challenge doesn't have a title" do
    expect(Challenge.count).to eq(0)

    visit "/challenges"
    click_link "New Challenge"
    expect(page).to have_content("New challenge")

    fill_in "Title", with: ""
    fill_in "Description", with: "Make the code really awesome"
    click_button "Create Challenge"

    expect(page).to have_content("error")
    expect(Challenge.count).to eq(0)

    visit "/challenges"
    expect(page).to_not have_content("Make the code really awesome")

  end

  it "displays an error when the challenge title is less than 5 characters" do
    expect(Challenge.count).to eq(0)

    visit "/challenges"
    click_link "New Challenge"
    expect(page).to have_content("New challenge")

    fill_in "Title", with: "Test"
    fill_in "Description", with: "Make the code really awesome"
    click_button "Create Challenge"

    expect(page).to have_content("error")
    expect(Challenge.count).to eq(0)

    visit "/challenges"
    expect(page).to_not have_content("Make the code really awesome")

  end
end
