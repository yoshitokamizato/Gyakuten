class MoneysController < ApplicationController
  before_action :move_to_index, except: :index

  def index
    @moneys = Money.all
  end

  def show
    @money = Money.find(params[:id])
  end

  def move_to_index
    redirect_to action: :index, flash: {error: "ログインしてください"} unless user_signed_in?
  end
end