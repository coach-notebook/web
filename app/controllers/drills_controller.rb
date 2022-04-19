class DrillsController < ApplicationController
  before_action :set_drill, only: [:show, :edit, :destroy]

  def safe_params
    params.require(:drill).permit(:name, :body, :duration_minutes, :library_id, :tags, :keys, :goals, :variations, :number_of_players)
  end

  def index
    @pagy, @drills = pagy Drill.all
  end

  def new
    @drill = Drill.new(library_id: params[:library_id])
    render template: "drills/form"
  end

  def edit
    render template: "drills/form"
  end

  def create
    @drill = Drill.create safe_params.merge({
      variations: JSON.parse(safe_params.fetch(:variations, "[]")),
      tags: JSON.parse(safe_params.fetch(:tags, "[]")),
      keys: JSON.parse(safe_params.fetch(:keys, "[]")),
      goals: JSON.parse(safe_params.fetch(:goals, "[]"))
    })
    if @drill.valid?
      flash[:success] = t("drill.created")
      redirect_to @drill
    else
      flash[:warning] = @drill.errors.full_messages
      render template: "drills/form"
    end
  end

  def update
    @drill.update(safe_params)
    if @drill.valid?
      redirect_to @drill
    else
      flash[:warning] = @drill.errors.full_messages
      render template: "drills/form"
    end
  end

  def set_drill
    @drill = Drill.find_by(id: params[:id], library: current_user.libraries)
  end
end
