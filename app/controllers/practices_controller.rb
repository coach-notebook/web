class PracticesController < ApplicationController
  before_action :ensure_enabled
  before_action :set_practice, only: [:edit, :update, :destroy, :show, :add_drill, :remote_drive]
  before_action :set_practices, only: [:edit, :new, :create, :update]
  before_action :set_libraries, only: [:edit, :new, :create, :update]
  before_action :set_drills, only: [:edit, :new, :create, :update, :show]
  before_action :set_squads, only: [:edit, :new, :create, :update]

  def safe_params
    params.require(:practice).permit(:practice_at, :copy_practice_id, :squad_id)
  end

  def index
    @pagy, @practices = pagy Practice.accessible_to(current_user)
  end

  def new
    if @libraries.empty?
      flash[:notice] = t("practice.libraries_empty")
      redirect_to new_library_path
    elsif @squads.empty?
      flash[:notice] = t("practice.squads_empty")
      redirect_to new_squad_path
    elsif @drills.empty?
      flash[:notice] = t("practice.drills_empty")
      redirect_to new_drill_path
    else
      @practice = Practice.new
      render template: "practices/form"
    end
  end

  def edit
    render template: "practices/form"
  end

  def create
    @practice = Practice.create(practice_at: safe_params[:practice_at], squad_id: safe_params[:squad_id])
    if @practice.valid?
      @practice.copy_drills_from(safe_params[:copy_practice_id])
      current_user.access_controls.create(access_controlled: @practice)
      flash[:success] = t("practice.create.success")
      redirect_to @practice
    else
      flash[:warning] = @practice.errors.full_messages
      render template: "practices/form"
    end
  end

  def update
    @practice.update(safe_params)
    if @practice.valid?
      flash[:success] = t("practice.update.success")
      redirect_to @practice
    else
      flash[:warning] = @practice.errors.full_messages
      render template: "practices/form"
    end
  end

  def destroy
    if @practice.delete
      flash[:success] = t("squad.delete.success")
    else
      flash[:warning] = @practice.errors.full_messages
    end
    redirect_to practices_path
  end

  def add_drill
    @practice.practice_drills.create(drill_id: params[:drill_id])
    redirect_to practice_path(@practice)
  end

  def remove_drill
    @practice.practice_drills.find_by(drill_id: params[:drill_id]).destroy
    redirect_to practice_path(@practice)
  end

  protected

  def set_practice
    @practice = Practice.accessible_to(current_user).find_by(id: params[:id])
    fail ActiveRecord::RecordNotFound unless @practice
  end

  def ensure_enabled
    render :not_found unless Flipper.enabled?(:drills, current_user)
  end
end
