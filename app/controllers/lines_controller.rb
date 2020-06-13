class LinesController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @lines = Line.all
  end

  def show
    @line = Line.find(params[:id])
  end
end
