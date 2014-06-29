module ChallengeHelpers

  def visit_challenge(challenge)
    visit "/challenges"
    within dom_id_for(challenge) do
      click_link challenge.title
    end
  end

end
