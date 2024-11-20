class UsersController < ApplicationController


  # Display all users
  def index
    @users = User.all
  end

  # Show form for creating a new user
  def new
    @user = User.new
  end

  # Create a new user
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path, notice: 'User was successfully created.'
    else
      render :new
    end
  end

  # Show a specific user and their details
  def show
      @user = User.find(params[:id])
    @p5_balance = @user.p5_balance
    @reward_balance = @user.reward_balance
  end

  # Display P5 history for a user
  def p5_history
    @user = User.find(params[:user_id])
    @p5_history = @user.reward_histories.where(action: 'P5 Given')
  end


  def rewards
    @reward_history = @user.reward_histories
  end


  private

  

  def user_params
    params.require(:user).permit(:name)
  end
end
