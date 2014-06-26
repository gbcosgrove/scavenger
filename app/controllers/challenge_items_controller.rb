class ChallengeItemsController < ApplicationController
  def index
    @challenge = Challenge.find(params[:challenge_id])
  end
end
