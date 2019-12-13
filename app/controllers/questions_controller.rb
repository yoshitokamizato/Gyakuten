class QuestionsController < ApplicationController
  before_action :ensure_correct_user, only: [:edit, :update]

  def index
    @questions = Question.all.order("created_at DESC")
    @question = Question.new
  end

  def show
    @question = Question.build_and_count_up(params[:id])
    @solutions = Solution.where(question_id: @question.id)
    @solution = @question.solutions.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      flash[:success] = "質問を投稿しました。"
      cookies.signed[:my_question] = { value: @question.id,
                                       expires: 1.weeks.from_now.utc }
      notifier = Slack::Notifier.new "https://hooks.slack.com/services/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"
      notifier.ping "質問が投稿されました"
      
      redirect_to questions_path
    else
      @questions = Question.all.order("created_at DESC")
      render 'questions/index'
    end
  end

  def edit
  end

  def update
    if @question.update(question_params)
      flash[:success] = "質問を修正しました。"
      redirect_to questions_path
    else
      render 'questions/edit'
    end
  end

  private

  def question_params
    params.require(:question).permit(:title, :details)
  end

  def ensure_correct_user
    @question = Question.find(params[:id])
    # 質問への回答が存在する場合にリダイレクト
    if (@question.solutions.length.positive? ||
        cookies[:my_question].nil? ||
        cookies.signed[:my_question].to_i != @question.id)
      flash[:warning] = "権限がありません。"
      redirect_to questions_path
    end
  end
end
