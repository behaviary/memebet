class StaticPagesController < ApplicationController
  before_action :redirect_current_user

  def about
  end

  def redirect_current_user
  	redirect_to memes_path if user_signed_in?
  end
end
