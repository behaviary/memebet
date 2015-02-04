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
		@meme.bets.build
	end

	def create
		@meme = current_user.memes.build(whitelisted_meme_params)
		@bet = @meme.bets.first
		if (@meme.save && @bet.save)
			# change this to highlight the created meme
			flash[:success] = "You have created a meme!"
			redirect_to memes_path
		else
			flash[:error] = "There was a problem"
			redirect_to new_meme_path
		end
	end

	def edit
	end

	def update
	end

	private
	def whitelisted_meme_params
	  params.require(:meme).
	  	permit(:title, :url, :description, :maturation_date,
	  				 bets_attributes: [:initial_value])
	end

end
