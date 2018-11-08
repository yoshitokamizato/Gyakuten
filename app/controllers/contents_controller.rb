class ContentsController < ApplicationController

  def index
    @texts = Text.all.order("id ASC")
    @movies = Movie.all.order("id ASC")
  end

  def show
    @texts = Text.all
  end

end
