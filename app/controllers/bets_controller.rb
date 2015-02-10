class BetsController < ApplicationController


	def new
		@bet = bettable_type.bets.build
	end

	def create
		# figure out how to get initial value from the form to show up here
		# I am too sick to do it right now :p
		@bet = bettable_type.bets.build(user_id: current_user.id)
	  if @bet.save
			flash[:success] = "The bet was made also, bro"
		else
			flash[:error] = "Something went wrong, bet didn't work"
			redirect_to request.referer
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