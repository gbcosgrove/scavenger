require 'spec_helper'

describe "Registering for the site" do
  it "allws a user to sign up for the site and creates the object in the database" do
    expect(User.count).to eq(0)

    visit "/"
    expect(page).to have_content("Sign Up")
    click_link "Sign Up"

    fill_in "First Name", with: "Joe"
    fill_in "Last Name", with: "Bloggs"
    fill_in "Email", with: "joebloggs@email.com"
    fill_in "Password", with: "password12345"
    fill_in "Password (again)", with: "password12345"
    click_button "Sign Up"

    expect(User.count).to eq(1)
  end
end
