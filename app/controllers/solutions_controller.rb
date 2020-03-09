class SolutionsController < ApplicationController
  before_action :authenticate_user!

  def create
    @question = Question.find(params[:question_id])
    @solution = @question.solutions.build(solution_params)
    if @solution.save
      flash[:success] = "回答を投稿しました。"
      redirect_to question_path(@question.id)
    else
      @solutions = Solution.where(question_id: @question.id)
      render "questions/show", question_id: @question.id
    end
  end

  private

    def solution_params
      params.require(:solution).permit(:content)
    end
end
