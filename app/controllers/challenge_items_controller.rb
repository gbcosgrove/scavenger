class ChallengeItemsController < ApplicationController

  before_action :find_challenge


  def index
  end

  def new
    @challenge_item = @challenge.challenge_items.new
  end

  def create
    @challenge_item = @challenge.challenge_items.new(challenge_item_params)
    if @challenge_item.save
      flash[:success] = "Added challenge item."
      redirect_to challenge_challenge_items_path
    else
      flash[:error] = "There was an error adding that challenge item"
      render action: :new
    end
  end

  def edit
    @challenge_item = @challenge.challenge_items.find(params[:id])
  end

  def update
    @challenge_item = @challenge.challenge_items.find(params[:id])
    if @challenge_item.update_attributes(challenge_item_params)
      flash[:success] = "Saved challenge item."
      redirect_to challenge_challenge_items_path
    else
      flash[:error] = "That challenge item could not be saved."
      render action: :edit
    end
  end

  def url_options
    { challenge_id: params[:challenge_id] }.merge(super)
  end

# This is required because of rails 4 strong parameters requirements
  private

  def find_challenge
    @challenge = Challenge.find(params[:challenge_id])
  end

  def challenge_item_params
    params[:challenge_item].permit(:content)
  end
end
