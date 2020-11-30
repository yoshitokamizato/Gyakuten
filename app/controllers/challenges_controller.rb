class ChallengesController < ApplicationController
  def index
    @challenges = Challenge.order(id: :asc)
    @complete_challenge_ids = current_user.complete_challenges.pluck(:challenge_id)
  end

  def show
    @challenge = Challenge.find(params[:id])
  end
end
