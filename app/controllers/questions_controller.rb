class QuestionsController < ApplicationController
  def index
    @q = Question.ransack(params[:q])
    @questions = @q.result(distinct: true).order(id: :desc)
    @all_questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
  end
end
