class ChallengeItemsController < ApplicationController
  def index
    @challenge = Challenge.find(params[:challenge_id])
  end

  def new
    @challenge = Challenge.find(params[:challenge_id])
    @challenge_item = @challenge.challenge_items.new
  end

  def create
    @challenge = Challenge.find(params[:challenge_id])
    @challenge_item = @challenge.challenge_items.new(challenge_item_params)
    if @challenge_item.save
      flash[:success] = "Added challenge item."
      redirect_to challenge_challenge_items_path
    else
      flash[:error] = "There was an error adding that challenge item"
      render action: :new
    end
  end

# This is required because of rails 4 strong parameters requirements
  private
  def challenge_item_params
    params[:challenge_item].permit(:content)
  end
end
