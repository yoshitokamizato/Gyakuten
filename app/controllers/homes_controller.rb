class HomesController < ApplicationController
  def index
    @contents_volume = Count.contents
  end
end
