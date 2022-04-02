class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: %i[show destroy update]

  def index
    users = User.all
    render json: users
  end

  def show
    render json: @user
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: user
    else
      render json: user.errors
    end
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

  def post_params
    params.require(:user).permit(:name, :email)
  end

end
