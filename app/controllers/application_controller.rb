class ApplicationController < ActionController::Base
  include Pagy::Backend

  helper_method :current_user

  def current_user
    Session.find_by(token: session[:token]).user
  rescue
    false
  end

  def param_array(params, key)
    param = params.fetch(key, "[]")
    return [] if param == ""
    JSON.parse(param)
  rescue => error
    Rails.logger.error error.inspect
    []
  end

  private

  def set_practices
    @practices = Practice.accessible_to(current_user)
  end

  def set_squads
    @squads = Squad.accessible_to(current_user)
  end

  def set_libraries
    @libraries = Library.accessible_to(current_user)
  end

  def set_teams
    @teams = Team.accessible_to(current_user)
  end

  def set_drills
    @drills = Drill.accessible_to(current_user)
  end

  def set_matches
    @matches = Match.accessible_to(current_user)
  end
end
