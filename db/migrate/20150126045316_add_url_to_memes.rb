class AddUrlToMemes < ActiveRecord::Migration
  def change
  	add_column :memes, :url, :string
  end
end
