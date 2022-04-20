class MatchesController < ApplicationController
  before_action :set_match, only: [:edit, :update, :destroy, :show]
  before_action :set_teams, only: [:edit, :new, :create, :update]

  def safe_params
    params.require(:match).permit(:name, :team_id, :played_at, :opposition, :result, :home_team)
  end

  def index
    @pagy, @matches = pagy Match.accessible_to(current_user)
  end

  def new
    if @teams.empty?
      flash[:notice] = t("match.teams_empty")
      redirect_to new_team_path
    else
      @match = Match.new
      render template: "matches/form"
    end
  end

  def edit
    render template: "matches/form"
  end

  def create
    @match = Match.create(safe_params)
    if @match.valid?
      current_user.access_controls.create(access_controlled: @match)
      flash[:success] = t("match.created")
      redirect_to @match
    else
      flash[:warning] = @match.errors.full_messages
      render template: "matches/form"
    end
  end

  def update
    @match.update(safe_params)
    if @match.valid?
      flash[:success] = t("match.updated")
      redirect_to @match
    else
      flash[:warning] = @match.errors.full_messages
      render template: "matches/form"
    end
  end

  def destroy
    if @match.delete
      flash[:success] = t("match.deleted")
    else
      flash[:warning] = @match.errors.full_messages
    end
    redirect_to matches_path
  end

  def set_match
    @match = Match.accessible_to(current_user).find_by(id: params[:id])
    fail ActiveRecord::RecordNotFound unless @match
  end
end
