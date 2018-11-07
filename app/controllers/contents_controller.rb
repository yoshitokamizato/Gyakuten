class ContentsController < ApplicationController
  before_action :move_to_index, except: :index

  def index
    @texts = Text.all
    @movies = Movie.all
  end

  def show
    @texts = Text.all
  end

  def move_to_index
    redirect_to action: :index, flash: {error: "ログインしてください"} unless user_signed_in?
  end

end
