class TeamsController < ApplicationController
  before_action :set_team, only: [:edit, :update, :destroy, :show]

  def safe_params
    params.require(:team).permit(:name, :squad_id)
  end

  def index
    @pagy, @teams = pagy Team.all
  end

  def new
    @team = Team.new
    render template: "teams/form"
  end

  def edit
    render template: "teams/form"
  end

  def create
    @team = Team.create(safe_params)
    if @team.valid?
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
      redirect_to teams_path
    else
      flash[:warning] = @team.errors.full_messages
      redirect_to teams_path
    end
  end

  def set_team
    @team = Team.find_by(id: params[:id])
    fail ActiveRecord::RecordNotFound unless @team
  end
end
