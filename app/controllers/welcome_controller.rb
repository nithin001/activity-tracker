class WelcomeController < ApplicationController
  GOOGLE_SIGN_ID = ENV['GOOGLE_SIGN_ID']

  skip_before_action :authenticate!
  def index
    if user_signed_in?
      redirect_to "/dashboard"
    end
  end
end
