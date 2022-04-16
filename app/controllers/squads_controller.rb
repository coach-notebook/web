class SquadsController < ApplicationController
  before_action :set_squad

  def safe_params
    params.require(:squad).permit(:season, :name, :competition)
  end

  def new
    @squad = @squads.build
    render template: "squads/form"
  end

  def edit
    render template: "squads/form"
  end

  def create
    @squad = @squads.create(safe_params.merge(active: true))
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
      render template: "squad/form"
    end
  end

  def set_squad
    @squads = @current_user.squads
    @squad = @squads.find_by(id: params[:id])
  end
end
