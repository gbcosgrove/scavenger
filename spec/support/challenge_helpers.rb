module ChallengeHelpers

  def visit_challenge(challenge)
    visit "/challenges"
    within dom_id_for(challenge) do
      click_link "List Items"
    end
  end

end
