class PlayersController < ApplicationController
  before_action :set_player

  def safe_params
    params.require(:player).permit(:name, :team_id)
  end

  def index
    @pagy, @players = pagy Player.all
  end

  def new
    @player = Player.new
    render template: "players/form"
  end

  def create
    @player = Player.create safe_params
    if @player.valid?
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

  def set_player
    @player = Player.accessible_to(current_user).find_by(id: params[:id])
    fail ActiveRecord::RecordNotFound unless @player
  end
end
