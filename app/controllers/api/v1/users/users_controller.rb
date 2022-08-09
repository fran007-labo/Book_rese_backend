class Api::V1::Users::UsersController < ApplicationController
  before_action :set_user, only: %i[show destroy update]
  
  def index
    users = User.all
    render json: users
  end

  def show
    render json: @user
  end

  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors
    end
  end

  def destroy
    if @user.destroy
      render json: @user
    else
      render json: @user.errors
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

end
