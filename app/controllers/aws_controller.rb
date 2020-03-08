class AwsController < ApplicationController
  before_action :authenticate_user!

  def index
    @aws = Aw.order("id ASC")
  end

  def show
    @aws = Aw.find(params[:id])
  end
end
