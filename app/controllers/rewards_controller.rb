class RewardsController < ApplicationController
  before_action :set_user 

  # Show rewards for a user
  def index
    @user = User.find(params[:user_id])
    @rewards = RewardHistory.where(given_by_id: @user.id)
  end

  # Show the form to create a new reward
  def new
    @users = User.where.not(id: @user.id)
    @p5_balance = @user.p5_balance
  end

  # Create a new reward
  def create
    @reward_amount = params[:reward_amount].to_i
    @recipient = User.find(params[:recipient_id])

    if @reward_amount > 100
      redirect_to new_user_reward_path(@user), alert: 'Reward amount cannot exceed 100 P5 points.'
      return
    end

    if @reward_amount <= 0
      redirect_to new_user_reward_path(@user), alert: 'Reward amount must be greater than zero.'
      return
    end

    if @reward_amount > @user.p5_balance
      redirect_to new_user_reward_path(@user), alert: 'Insufficient P5 balance.'
      return
    end

    # Deduct P5 from the user and add it to the recipient
    @user.update(p5_balance: @user.p5_balance - @reward_amount)
    @recipient.update(p5_balance: @recipient.reward_balance.to_i + @reward_amount)

    # Create a reward history record
    RewardHistory.create!(
      points: @reward_amount,
      given_by_id: @user.id,
      given_to_id: @recipient.id,
      action: 'Reward Given',
      user_id: @user.id
    )
    # Redirect to rewards page after successful creation
    redirect_to user_rewards_path(@user), notice: 'Reward successfully created.'
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end
end
