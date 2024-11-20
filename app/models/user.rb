class User < ApplicationRecord
  has_many :reward_histories, dependent: :destroy
   has_many :given_rewards, class_name: 'RewardHistory', foreign_key: 'given_by_id', dependent: :destroy  # Rewards given by this user
  has_many :rewards, through: :reward_histories
end