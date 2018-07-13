class ApplicationController < ActionController::Base
  before_action :authenticate!
  
  private
  def current_user
    @current_user ||= session[:user_id]
  end

  private
  def user_signed_in?
    return 1 if current_user
  end

  private
  def authenticate!
    if not user_signed_in?
     redirect_to "/"
    end
  end
end
