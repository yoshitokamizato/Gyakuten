class ContentsController < ApplicationController

  def index
    @contents = Content.build_objects
  end

  def show
    @texts = Text.all
  end

end
