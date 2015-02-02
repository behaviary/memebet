class BetsController < ApplicationController

	before_action :authenticate_user!

	def create
		@bet = bettable_type.bets.build(user_id: current_user.id)
		if @bet.save
			redirect_to request.referer
		else
			flash[:error] = "Something went wrong, bet didn't work"
			redirect_to request.referer
		end
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