class UsersController < ApplicationController
  def index
    @suers = User.all
  end
   
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new(user_parameter)
    render json: { status: 200, message: "Hello World!"}
  end 

  def create
    @user = User.new(user_parameter)
    if @client.save
      redirect_to @client
    else
  end

  private
  def user_parameter
    params.require(:user).permit(:name, :email)
  end

end
