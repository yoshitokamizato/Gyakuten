class CompleteChallengesController < ApplicationController
  def create
    @challenge_id = params[:challenge_id]
    current_user.complete_challenges.create!(challenge_id: @challenge_id)
  end

  def destroy
    @challenge_id = params[:challenge_id]
    CompleteChallenge.find_by(user_id: current_user.id, challenge_id: @challenge_id).destroy!
  end
end
