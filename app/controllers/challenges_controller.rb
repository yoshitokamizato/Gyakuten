class ChallengesController < ApplicationController
  def index
    @challenges = Challenge.order(id: :asc)
  end

  def show
    @challenge = Challenge.find(params[:id])
  end
end
