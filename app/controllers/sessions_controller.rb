class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token
  skip_before_action :authenticate!

  def create
    if user = authenticate_via_google
      session[:user_id] = user
      redirect_to "/dashboard"
    else
      redirect_to new_session_url, alert: "authentication_failed"
    end
  end

  private
  def authenticate_via_google
    if params[:google_id_token].present?
      GoogleSignIn::Identity.new(params[:google_id_token]).user_id
    end
  end
end
