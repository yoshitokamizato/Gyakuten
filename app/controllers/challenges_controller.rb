class ChallengesController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @challenges = Challenge.order(id: :asc)
    if user_signed_in?
      @complete_challenge_ids = current_user.complete_challenges.pluck(:challenge_id)
    end
  end

  def show
    @challenge = Challenge.find(params[:id])
  end
end
