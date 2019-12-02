class VideoedittingsController < ApplicationController
  before_action :authenticate_user!

  def index
    @viedeoedittings = Movie.disp_modvieedittings
  end

end
