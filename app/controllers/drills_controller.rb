class DrillsController < ApplicationController
  before_action :set_drill, only: [:show, :edit, :update, :destroy]
  before_action :set_libraries, only: [:edit, :new, :create, :update]

  def safe_params
    params.require(:drill).permit(:name, :body, :duration_minutes, :library_id, :tags, :keys, :goals, :variations, :number_of_players)
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
      variations: JSON.parse(safe_params.fetch(:variations, "[]")),
      tags: JSON.parse(safe_params.fetch(:tags, "[]")),
      keys: JSON.parse(safe_params.fetch(:keys, "[]")),
      goals: JSON.parse(safe_params.fetch(:goals, "[]"))
    })
    if @drill.valid?
      current_user.access_controls.create(access_controlled: @drill)
      flash[:success] = t("drill.created")
      redirect_to @drill
    else
      flash[:warning] = @drill.errors.full_messages
      render template: "drills/form"
    end
  end

  def update
    @drill.update(safe_params.merge({
      variations: JSON.parse(safe_params.fetch(:variations, "[]")),
      tags: JSON.parse(safe_params.fetch(:tags, "[]")),
      keys: JSON.parse(safe_params.fetch(:keys, "[]")),
      goals: JSON.parse(safe_params.fetch(:goals, "[]"))
    }))
    if @drill.valid?
      redirect_to @drill
    else
      flash[:warning] = @drill.errors.full_messages
      render template: "drills/form"
    end
  end

  def set_drill
    @drill = Drill.accessible_to(current_user).find_by(id: params[:id])
    fail ActiveRecord::RecordNotFound unless @drill
  end
end
