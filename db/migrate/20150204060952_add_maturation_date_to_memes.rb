class AddMaturationDateToMemes < ActiveRecord::Migration
  def change
  	add_column :memes, :maturation_date, :date
  end
end
