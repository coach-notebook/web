class AppearancesController < ApplicationController
  before_action :ensure_enabled
  before_action :set_appearance, only: [:edit, :update, :destroy, :show]
  before_action :set_match, only: [:edit, :new]
  before_action :set_matches, only: [:new, :create, :create, :update]

  def safe_params
    params.require(:appearance).permit(:match_id, :starting_position, :player_id)
  end

  def index
    @pagy, @appearances = pagy Appearance.accessible_to(current_user)
  end

  def new
    if @matches.empty?
      flash[:notice] = t("appearance.matches_empty")
      redirect_to new_team_path
    else
      @appearance = @match.appearances.build
      render template: "appearances/form"
    end
  end

  def edit
    render template: "appearances/form"
  end

  def create
    @appearance = Appearance.create(safe_params)
    @match = @appearance.match
    logger.info @appearance.inspect
    if @appearance.valid?
      current_user.access_controls.create(access_controlled: @appearance)
      flash[:success] = t("appearance.create.success")
      redirect_to @appearance
    else
      flash[:warning] = @appearance.errors.full_messages
      render template: "appearances/form"
    end
  end

  def update
    @appearance.update(safe_params)
    if @appearance.valid?
      flash[:success] = t("appearance.update.success")
      redirect_to @appearance
    else
      flash[:warning] = @appearance.errors.full_messages
      render template: "appearances/form"
    end
  end

  def destroy
    if @appearance.delete
      flash[:success] = t("appearance.deleted")
    else
      flash[:warning] = @appearance.errors.full_messages
    end
    redirect_to appearances_path
  end

  private

  def set_match
    @match = Match.accessible_to(current_user).find_by(id: params[:match_id])
  end

  def set_appearance
    @appearance = Appearance.accessible_to(current_user).find_by(id: params[:id])
    fail ActiveRecord::RecordNotFound unless @appearance
  end

  def ensure_enabled
    head :unauthorized unless Flipper.enabled?(:appearances, current_user)
  end
end
