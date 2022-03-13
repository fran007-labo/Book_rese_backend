class UsersController < ApplicationController
  def index
    render json: User.all
  end
   
  def show
    render json: User.find(params[:id])
  end

  def new
    @user = User.new
    render json: { status: 200, message: "Hello World!"}
  end 

  def create
    @user = User.new(user_parameter)
    if @client.save
      redirect_to @client
    end
  end

  private
  def user_parameter
    params.require(:user).permit(:name, :email)
  end

end
