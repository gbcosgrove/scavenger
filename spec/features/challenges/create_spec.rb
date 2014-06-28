require 'spec_helper'

describe "Creating challenges" do

  let(:user) { create(:user) }

  def create_challenge(options={})
    options[:title] ||= "My challenge"
    options[:description] ||= "This is my challenge."

    visit "/challenges"
    click_link "New Challenge"
    expect(page).to have_content("New Challenge")

    fill_in "Title", with: options[:title]
    fill_in "Description", with: options[:description]
    click_button "Create Challenge"
  end

  before do
    sign_in user, password: "testpassword1"
  end

  it "redirects to the challenge index page on success" do
    create_challenge
    expect(page).to have_content("My challenge")
  end

  it "displays an error when the challenge has no title" do
    expect(Challenge.count).to eq(0)

    create_challenge title: ""

    expect(page).to have_content("error")
    expect(Challenge.count).to eq(0)

    visit "/challenges"
    expect(page).to_not have_content("This is what I'm doing today.")
  end

  it "displays an error when the challenge has a title less than 3 characters" do
    expect(Challenge.count).to eq(0)

    create_challenge title: "Hi"

    expect(page).to have_content("error")
    expect(Challenge.count).to eq(0)

    visit "/challenges"
    expect(page).to_not have_content("This is what I'm doing today.")
  end

  it "displays an error when the challenge has no description" do
    expect(Challenge.count).to eq(0)

    create_challenge title: "Create an App", description: ""

    expect(page).to have_content("error")
    expect(Challenge.count).to eq(0)

    visit "/challenges"
    expect(page).to_not have_content("Create an App")
  end

  it "displays an error when the challenge has no description" do
    expect(Challenge.count).to eq(0)

    create_challenge title: "Create an App", description: ""

    expect(page).to have_content("error")
    expect(Challenge.count).to eq(0)

    visit "/challenges"
    expect(page).to_not have_content("Create an App")
  end
end
