class AddActionToRewardHistories < ActiveRecord::Migration[7.1]
  def change
    add_column :reward_histories, :action, :string
  end
end
