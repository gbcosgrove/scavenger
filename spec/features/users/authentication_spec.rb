require "spec_helper"

describe "Logging In" do
  it "logs the user in and goes to the challenges" do
    User.create(first_name: "Joe", last_name: "Bloggs", email: "joe@email.com", password: "testpassword", password_confirmation: "testpassword")
    visit new_user_session_path
    fill_in "Email Address", with: "joe@email.com"
    fill_in "Password", with: "testpassword"
    click_button "Log In"

    expect(page).to have_content("Challenges")
    expect(page).to have_content("Thanks for logging in!")
  end

  it "diplays the email address in the event of a failed login" do
    visit new_user_session_path
    fill_in "Email Address", with: "joe@email.com"
    fill_in "Password", with: "incorrect"
    click_button "Log In"

    expect(page).to have_content("Please check your email and password")
    expect(page).to have_field("Email Address", with: "joe@email.com")
  end
end
