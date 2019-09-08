class QuestionsController < ApplicationController
  def index
    @questions = Question.all.order("created_at DESC")
    @question = Question.new
  end

  def show
    @question = Question.build_and_count_up(params[:id])
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      flash[:success] = "質問を投稿しました。"
      redirect_to questions_path
    else
      @questions = Question.all.order("created_at DESC")
      render 'questions/index'
    end
  end

  private

  def question_params
    params.require(:question).permit(:title, :details)
  end
end
