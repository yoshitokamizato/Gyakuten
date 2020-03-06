class AwsController < ApplicationController
  before_action :authenticate_user!
  before_action :move_to_index, except: :index

  def index
    @aws = Aw.order("id ASC")
  end

  def show
    @aws = Aw.find(params[:id])
  end

end
