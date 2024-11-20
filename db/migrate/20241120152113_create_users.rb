class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.string :name
      t.integer :p5_balance
      t.integer :reward_balance

      t.timestamps
    end
  end
end
