class CreateMemes < ActiveRecord::Migration
  def change
    create_table :memes do |t|
    	t.string :author_id, :null => false
    	t.string :title, :null => false
    	t.string :description
    	t.integer :initial_bet

      t.timestamps
    end
  end
end
