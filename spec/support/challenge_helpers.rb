module ChallengeHelpers

  def visit_challenge(challenge)
    visit "/challenges"
    within "#challenge_#{challenge.id}" do
      click_link "List Items"
    end
  end

end
