class QuestionsController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    if user_signed_in?
      @q = Question.ransack(params[:q])
      @questions = @q.result.order(:genre).order(id: :desc)
      @all_questions = Question.order(:genre).select(:genre).distinct
    else
      @questions = Question.order(:genre).order(id: :desc)
    end
  end

  def show
    @question = Question.find(params[:id])
  end
end
