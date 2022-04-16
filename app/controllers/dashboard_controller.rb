class DashboardController < ApplicationController
  def show
    @matches = Match.accessible_to(current_user).limit(8).where("played_at < NOW()")
    @practices = Practice.accessible_to(current_user).limit(8).where("practice_at > NOW()")
  end
end
