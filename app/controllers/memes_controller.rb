class MemesController < ApplicationController

	before_action :authenticate_user!, :except => [:show, :index]
	# add require author so people can see a list of their meme

	def index
		@memes = Meme.all
	end

	def show
	end

	def new
		@meme = Meme.new
	end

	def create
		@meme = current_user.memes.build(whitelisted_meme_params)
		if @meme.save
			# change this to highlight the created meme
			flash[:success] = "You have created a meme!"
			redirect_to memes_path
		end
	end

	def edit
	end

	def update
	end

	private
	def whitelisted_meme_params
	  params.require(:meme).permit(:title, :url, :description)
	end

end
