class BetsController < ApplicationController

	before_action :authenticate_user!

	def new
		@meme = Meme.find(params[:meme_id])
		if !!@meme.bets.find_by(user_id: current_user.id)
			flash[:error] = "You already bet on this!"
			redirect_to root_path
		end
		@bet = @meme.bets.new
	end

	def create
		@meme = Meme.find(params[:meme_id])
		@bet = @meme.bets.build(whitelisted_bets_params)
		@bet.user_id = current_user.id
	  if @bet.save
	  	success = ["You got a deal",
	  						 "The bet was made also, bro",
	  						 "You're on!",
	  						 "You just put your points where your internet is!"]
			flash[:success] = success[rand(4)]
			redirect_to root_path
		else
			flash[:error] = "Something went wrong, bet didn't work"
			redirect_to request.referrer
		end
	end

	def destroy
	end

	private

	def whitelisted_bets_params
		params.require(:bet).permit(:user_id, :bettable_type, :bettable_id, :initial_value)
	end

  def bettable_type
  	bettable_class.find(initial_value: params[:bets][:initial_value])
  end

  def bettable_class
  	params[:bettable].singularize.classify.constantize
  end

  def parent_id
    "#{params[:bettable].to_s}_id".downcase.to_sym
  end

end