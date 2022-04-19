class SquadsController < ApplicationController
  before_action :set_squad, only: [:edit, :update, :show, :destroy]

  def safe_params
    params.require(:squad).permit(:season, :name, :competition)
  end

  def index
    @pagy, @squads = pagy Squad.all
  end

  def new
    @squad = Squad.new
    render template: "squads/form"
  end

  def edit
    render template: "squads/form"
  end

  def create
    @squad = Squad.create(safe_params.merge(active: true, user: current_user))
    if @squad.valid?
      flash[:success] = t("squad.created")
      redirect_to @squad
    else
      flash[:warning] = @squad.errors.full_messages
      render template: "squads/form"
    end
  end

  def update
    @squad.update(safe_params)
    if @squad.valid?
      redirect_to @squad
    else
      flash[:warning] = @squad.errors.full_messages
      render template: "squads/form"
    end
  end

  def destroy
    if @squad.delete
      flash[:success] = t("squad.deleted")
      redirect_to squads_path
    else
      flash[:warning] = @squad.errors.full_messages
      redirect_to squads_path
    end
  end

  def set_squad
    @squad = Squad.find_by(id: params[:id], user: current_user)
    fail ActiveRecord::RecordNotFound unless @squad
  end
end
