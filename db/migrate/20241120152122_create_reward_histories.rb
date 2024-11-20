class CreateRewardHistories < ActiveRecord::Migration[8.0]
  def change
    create_table :reward_histories do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :points
      t.string :given_by_id
      t.string :given_to_id

      t.timestamps
    end
  end
end
