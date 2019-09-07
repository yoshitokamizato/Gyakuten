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
      redirect_to questions_path, success: '記事を作成しました。'
    else
      flash[:warning] = @post.errors.full_messages.join(', ')
      render 'questions/index'
    end
  end

  private

  def question_params
    params.require(:question).permit(:title, :details)
  end
end
