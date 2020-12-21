class QuestionsController < ApplicationController
  def index
    @questions = Question.order(id: :desc)
  end

  def show
    @question = Question.find(params[:id])
  end
end
