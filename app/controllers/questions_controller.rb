class QuestionsController < ApplicationController
  def index
    @questions = Question.all.order("created_at DESC")
  end

  def show
    @question = Question.build_and_count_up(params[:id])
  end
end
