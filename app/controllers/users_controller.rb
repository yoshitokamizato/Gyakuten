class UsersController < ApplicationController
  def index
  end

  def new
  end

  def create
    User.create(users_params)
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
