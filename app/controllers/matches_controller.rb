class MatchesController < ApplicationController
  before_action :set_match, only: [:edit, :update, :destroy, :show]

  def safe_params
    params.require(:match).permit(:name, :squad_id)
  end

  def index
    @pagy, @matches = pagy Match.all
  end

  def new
    @match = Match.new
    render template: "matches/form"
  end

  def edit
    render template: "matches/form"
  end

  def create
    @match = Match.create(safe_params)
    if @match.valid?
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
      redirect_to matches_path
    else
      flash[:warning] = @match.errors.full_messages
      redirect_to matches_path
    end
  end

  def set_match
    @match = Match.find_by(id: params[:id])
    fail ActiveRecord::RecordNotFound unless @match
  end
end
