class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
    respond_to do |format|
      format.html
      format.js
    end
  end

  def apple_params
    params.require(:apple).permit(:name)
  end

  def create
    @users = User.all
    @user = User.new(users_params)
    respond_to do |format|
      if @user.save
        format.html
        format.js
      else
        format.js {render :new}
      end
    end
  end

  def show
  end

  def update
  end

  def edit
  end

  def destroy
  end

  private

  def users_params
    params.require(:user).permit(:name, :program_id, :error_id)
  end
end
