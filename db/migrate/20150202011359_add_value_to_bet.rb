class AddValueToBet < ActiveRecord::Migration
  def change
  	add_column :bets, :initial_value, :integer
  end
end
