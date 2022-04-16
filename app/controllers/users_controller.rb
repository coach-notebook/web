class UsersController < ApplicationController
  def safe_params
    params.permit(:email_address, :password)
  end

  def new
    @user = User.new
    render template: "users/form", layout: "sessions"
  end

  def create
    @user = User.create(safe_params)
    if @user.valid?
      user_session = @user.sessions.create
      session[:token] = user_session.token
      flash[:success] = t("user.created")
      redirect_to root_path
    else
      flash[:warning] = @user.errors.full_messages
      render template: "users/form"
    end
  end
end
