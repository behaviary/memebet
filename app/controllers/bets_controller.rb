class BetsController < ApplicationController

	def new
		@meme = Meme.find(params[:meme_id])
		@bet = @meme.bets.new
	end

	def create
		@meme = Meme.find(params[:meme_id])
		@bet = @meme.bets.build(whitelisted_bets_params)
	  if @bet.save
			flash[:success] = "The bet was made also, bro"
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