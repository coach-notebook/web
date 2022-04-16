class TeamsController < ApplicationController
  before_action :set_team, only: [:edit, :update, :destroy, :show]
  before_action :set_squads, only: [:edit, :new, :create, :update]

  def safe_params
    params.require(:team).permit(:name, :squad_id)
  end

  def index
    @pagy, @teams = pagy Team.accessible_to(current_user)
  end

  def new
    if @squads.empty?
      flash[:notice] = t("team.squads_empty")
      redirect_to new_squad_path
    else
      @team = Team.new
      render template: "teams/form"
    end
  end

  def edit
    render template: "teams/form"
  end

  def create
    @team = Team.create(safe_params)
    if @team.valid?
      current_user.access_controls.create(access_controlled: @team)
      flash[:success] = t("team.created")
      redirect_to @team
    else
      flash[:warning] = @team.errors.full_messages
      render template: "teams/form"
    end
  end

  def update
    @team.update(safe_params)
    if @team.valid?
      flash[:success] = t("team.updated")
      redirect_to @team
    else
      flash[:warning] = @team.errors.full_messages
      render template: "teams/form"
    end
  end

  def destroy
    if @team.delete
      flash[:success] = t("team.deleted")
    else
      flash[:warning] = @team.errors.full_messages
    end
    redirect_to teams_path
  end

  def set_team
    @team = Team.accessible_to(current_user).find_by(id: params[:id])
    fail ActiveRecord::RecordNotFound unless @team
  end
end
