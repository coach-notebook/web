class DrillsController < ApplicationController
  before_action :ensure_enabled
  before_action :set_drill, only: [:show, :edit, :update, :destroy]
  before_action :set_libraries, only: [:edit, :new, :create, :update]

  def safe_params
    params.require(:drill).permit(:name, :body, :library_id, :duration_minutes, :number_of_players, :variations, :keys, :goals, :tag_list)
  end

  def index
    @pagy, @drills = pagy Drill.accessible_to(current_user)
  end

  def new
    if @libraries.empty?
      flash[:notice] = t("drill.libraries_empty")
      redirect_to new_library_path
    else
      @drill = Drill.new
      render template: "drills/form"
    end
  end

  def edit
    render template: "drills/form"
  end

  def create
    @drill = Drill.create safe_params.merge({
      user: current_user,
      variations: param_array(safe_params, :variations),
      tag_list: param_array(safe_params, :tag_list),
      keys: param_array(safe_params, :keys),
      goals: param_array(safe_params, :goals),
    })
    if @drill.valid?
      current_user.access_controls.create(access_controlled: @drill)
      flash[:success] = t("drill.create.success")
      redirect_to @drill
    else
      flash[:warning] = @drill.errors.full_messages
      render template: "drills/form"
    end
  end

  def update
    @drill.update(safe_params.merge({
      variations: param_array(safe_params, :variations),
      tag_list: param_array(safe_params, :tag_list),
      keys: param_array(safe_params, :keys),
      goals: param_array(safe_params, :goals),
    }))
    if @drill.valid?
      redirect_to @drill
    else
      flash[:warning] = @drill.errors.full_messages
      render template: "drills/form"
    end
  end

  private

  def set_drill
    @drill = Drill.accessible_to(current_user).find_by(id: params[:id])
    fail ActiveRecord::RecordNotFound unless @drill
  end

  def ensure_enabled
    head :unauthorized unless Flipper.enabled?(:drills, current_user)
  end
end
