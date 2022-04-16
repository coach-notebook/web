class SessionsController < ApplicationController
  def new
    render template: "sessions/form"
  end

  def create
    user = User.find_by(email_address: params[:email_address])
    if user.present? && user.authenticate(params[:password])
      if user_session = user.sessions.create
        session[:token] = user_session.token
        redirect_to root_path, notice: t("session.create.success")
      end
    else
      flash[:warning] = t("session.create.failed")
      render template: "sessions/form"
    end
  end

  def destroy
    session[:token] = nil
    redirect_to signin_path, notice: t("session.destroy.success")
  end

  def safe_params
    params.require(:user).permit(:email_address, :password, :competition)
  end
end
