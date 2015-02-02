class BetsController < ApplicationController


	def create

		# figure out how to get initial value from the form to show up here
		# I am too sick to do it right now :p
		@bet = bettable_type.bets.build(user_id: current_user.id)
	  @bet.save
		# 	flash[:success] = "The bet was made also, bro"
		# else
		# 	flash[:error] = "Something went wrong, bet didn't work"
		# 	redirect_to request.referer
		# end
	end

	def destroy
	end

	private

  def bettable_type
  	bettable_class.find(params[parent_id])
  end

  def bettable_class
  	params[:bettable].singularize.classify.constantize
  end

  def parent_id
    "#{params[:bettable].to_s}_id".downcase.to_sym
  end

end