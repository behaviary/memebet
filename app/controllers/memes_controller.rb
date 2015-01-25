class MemesController < ApplicationController

	def index
		@memes = Meme.all
	end

	def show
	end

	def new
		@meme = Meme.new
	end

	def create
	end

	def edit
	end

	def update
	end

	private
	def whitelisted_meme_params
	  params.require(:meme).permit(:title, :description)
	end

end
