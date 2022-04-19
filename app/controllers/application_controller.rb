class ApplicationController < ActionController::Base
  include Pagy::Backend

  helper_method :current_user

  def current_user
    Session.find_by(token: session[:token]).user
  rescue
    false
  end
end
