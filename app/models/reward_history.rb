class RewardHistory < ApplicationRecord
  validates :points, numericality: { greater_than: 0 }
  validates :action, presence: true
end
