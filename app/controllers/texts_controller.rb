class TextsController < ApplicationController
  before_action :authenticate_user!
  before_action :move_to_index, except: :index

  def index
    @texts = Text.show_contents_list
  end

  def show
    @text = Text.find(params[:id])
  end

end
