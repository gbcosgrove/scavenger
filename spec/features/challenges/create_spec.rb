require 'spec_helper'

describe "Creating challenges" do

    def create_challenge(options={})
        options[:title] ||= "Write Code"
        options[:description] ||= "Write some really awesome code"

        visit "/challenges"
        click_link "New Challenge"
        expect(page).to have_content("New challenge")

        fill_in "Title", with: options[:title]
        fill_in "Description", with: options[:description]
        click_button "Create Challenge"
    end

    it "redirects to the challenge list index page on success" do

        create_challenge

        expect(page).to have_content("Write Code")

    end

    it "displays an error when the challenge doesn't have a title" do
        expect(Challenge.count).to eq(0)

        create_challenge title: ""

        expect(page).to have_content("error")
        expect(Challenge.count).to eq(0)

        visit "/challenges"
        expect(page).to_not have_content("Write a bunch of code")

    end

    it "displays an error when the challenge title is less than 5 characters" do
        expect(Challenge.count).to eq(0)

        create_challenge title: "Test"

        expect(page).to have_content("error")
        expect(Challenge.count).to eq(0)

        visit "/challenges"
        expect(page).to_not have_content("Write a bunch of code")

    end

    it "displays an error when the challenge doesn't have a description" do
    expect(Challenge.count).to eq(0)

        create_challenge title: "Create spec tests", description: ""

        expect(page).to have_content("error")
        expect(Challenge.count).to eq(0)

        visit "/challenges"
        expect(page).to_not have_content("Create spec tests")

    end

    it "displays an error when the challenge description is less than 10 characters" do
        expect(Challenge.count).to eq(0)

        create_challenge title: "Create spec tests", description: "Code"

        expect(page).to have_content("error")
        expect(Challenge.count).to eq(0)

        visit "/challenges"
        expect(page).to_not have_content("Create spec tests")

    end
end
