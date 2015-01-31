class CreateBets < ActiveRecord::Migration
  def change
    create_table :bets do |t|
    	t.belongs_to :user
    	t.belongs_to :bettable, polymorphic: true

      t.timestamps
    end
  end
end
