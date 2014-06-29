require 'spec_helper'

describe "Viewing challenge items" do
  let(:user) { challenge.user }
  let!(:challenge) { create(:challenge) }
  before { sign_in user, password: 'testpassword1'}

  it "displays the title of the challenge" do
    visit_challenge(challenge)
    within("h3.page-title") do
      expect(page).to have_content(challenge.title)
    end
  end

  it "displays no items when a challenge is empty" do
    visit_challenge(challenge)
    expect(page.all("ul.challenge_items li").size).to eq(0)
  end

  it "displays item content when a challenge has items" do
    challenge.challenge_items.create(content: "Never Sleep")
    challenge.challenge_items.create(content: "Work all the time")

    visit_challenge(challenge)

    expect(page.all("ul.challenge_items li").size).to eq(2)

    within "ul.challenge_items" do
      expect(page).to have_content("Never Sleep")
      expect(page).to have_content("Work all the time")
    end
  end
end
