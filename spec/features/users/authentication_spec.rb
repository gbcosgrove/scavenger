require "spec_helper"

describe "Logging In" do
  it "logs the user in and goes to the todo lists" do
    User.create(first_name: "Joe", last_name: "Bloggs", email: "joebloggs@email.com", password: "test12345", password_confirmation: "test12345")
    visit new_user_session_path
    fill_in "Email Address", with: "joebloggs@email.com"
    fill_in "Password", with: "test12345"
    click_button "Log In"

    expect(page).to have_content("Challenges")
    expect(page).to have_content("Thanks for logging in!")
  end

  it "diplays the email address in the event of a failed login" do
    visit new_user_session_path
    fill_in "Email Address", with: "joebloggs@email.com"
    fill_in "Password", with: "incorrect"
    click_button "Log In"

    expect(page).to have_content("Please check your email and password")
    expect(page).to have_field("Email Address", with: "joebloggs@email.com")
  end
end
