class ContentsController < ApplicationController

  def index
    @texts = Text.all
    @movies = Movie.all
  end

  def show
    @texts = Text.all
  end

end
