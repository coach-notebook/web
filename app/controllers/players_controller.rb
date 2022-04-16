class PlayersController < ApplicationController
  before_action :ensure_enabled
  before_action :set_player, only: [:show, :edit, :update]
  before_action :set_teams, only: [:edit, :new, :create, :update]

  def safe_params
    params.require(:player).permit(:name, :team_id, :squad_id)
  end

  def index
    @pagy, @players = pagy Player.accessible_to(current_user)
  end

  def new
    @player = Player.new
    render template: "players/form"
  end

  def create
    @player = Player.create safe_params
    if @player.valid?
      @player.update(squad: @player.team.squad)
      current_user.access_controls.create(access_controlled: @player)
      flash[:success] = t("player.created")
      redirect_to @player
    else
      flash[:warning] = @player.errors.full_messages
      render template: "players/form"
    end
  end

  def edit
    render template: "players/form"
  end

  def update
    @player.update safe_params
    if @player.valid?
      flash[:success] = t("player.updated")
      redirect_to @player
    else
      flash[:warning] = @player.errors.full_messages
      render template: "players/form"
    end
  end

  protected

  def set_player
    @player = Player.accessible_to(current_user).find_by(id: params[:id])
    fail ActiveRecord::RecordNotFound unless @player
  end

  def set_squads
    @teams = Team.accessible_to(current_user)
  end

  def ensure_enabled
    head :unauthorized unless Flipper.enabled?(:matches, current_user)
  end
end
