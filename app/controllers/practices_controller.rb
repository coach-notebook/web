class PracticesController < ApplicationController
  before_action :set_practice, only: [:edit, :update, :destroy, :show, :add_drill, :remote_drive]

  def safe_params
    params.require(:practice).permit(:practice_at, :copy_practice_id, :squad_id)
  end

  def index
    @pagy, @practices = pagy Practice.all
  end

  def new
    @practice = Practice.new
    render template: "practices/form"
  end

  def edit
    render template: "practices/form"
  end

  def create
    @practice = Practice.create(practice_at: safe_params[:practice_at], squad_id: safe_params[:squad_id])
    @practice.copy_drills_from(safe_params[:copy_practice_id])
    if @practice.valid?
      flash[:success] = t("squad.created")
      redirect_to @practice
    else
      flash[:warning] = @practice.errors.full_messages
      render template: "practices/form"
    end
  end

  def update
    @practice.update(safe_params)
    if @practice.valid?
      flash[:success] = t("squad.updated")
      redirect_to @practice
    else
      flash[:warning] = @practice.errors.full_messages
      render template: "practices/form"
    end
  end

  def destroy
    if @practice.delete
      flash[:success] = t("squad.deleted")
      redirect_to practices_path
    else
      flash[:warning] = @practice.errors.full_messages
      redirect_to practices_path
    end
  end

  def add_drill
    @practice.practice_drills.create(drill_id: params[:drill_id])
    redirect_to practice_path(@practice)
  end

  def remove_drill
    @practice.practice_drills.find_by(drill_id: params[:drill_id]).destroy
    redirect_to practice_path(@practice)
  end

  def set_practice
    @practice = Practice.find_by(id: params[:id])
    fail ActiveRecord::RecordNotFound unless @practice
  end
end
