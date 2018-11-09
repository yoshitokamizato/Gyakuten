class LinesController < ApplicationController
  before_action :move_to_index, except: :index

  def index
    @lines = Line.all
  end

  def show
    @line = Line.find(params[:id])
  end

  def move_to_index
    redirect_to action: :index, flash: {error: "ログインしてください"} unless user_signed_in?
  end

end
