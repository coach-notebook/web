class DashboardController < ApplicationController
  def show
    redirect_to signin_path and return unless current_user
    @matches = Match.accessible_to(current_user).limit(8).where("played_at < NOW()") if Flipper.enabled?(:matches, current_user)
    @practices = Practice.accessible_to(current_user).limit(8).where("practice_at > NOW()") if Flipper.enabled?(:drills, current_user)
  end
end
