class Meme < ActiveRecord::Base

	validates_presence_of :title
	validates_uniqueness_of :url

end
