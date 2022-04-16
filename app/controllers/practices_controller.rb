class PracticesController < ApplicationController
  before_action :set_practice

  def safe_params
    params.require(:practice).permit(:practice_at, :copy_practice_id, :squad_id, :review)
  end

  def new
    @practice = Practice.new(squad_id: params[:squad_id])
    render template: "practices/form"
  end

  def create
    @original_practice = @squad.practices.find_by(id: safe_params[:copy_practice_id])
    @practice = @squad.practices.create(practice_at: safe_params[:practice_at])
    if @practice.valid?
      @original_practice.drills.each do |drill|
        @practice.practice_drills.create(drill: drill)
      end
      flash[:success] = t("squad.created")
      redirect_to [@squad, @practice]
    else
      flash[:warning] = @squad.errors.full_messages
      render template: "drills/new"
    end
  end

  def update
    @practice.update(safe_params)
    if @practice.valid?
      redirect_to [@squad, @practice]
    else
      flash[:warning] = @squad.errors.full_messages
      render template: "squads/form"
    end
  end

  def add_drill
    @drill = @current_user.drills.find_by(id: params[:drill_id])
    @practice = Practice.find_by(id: params[:id], squad: @current_user.squads)
    @practice.practice_drills.create(drill: @drill)
    redirect_to practice_path(@practice)
  end

  def remove_drill
    @drill = @current_user.drills.find_by(id: params[:drill_id])
    @practice = Practice.find_by(id: params[:id], squad: @current_user.squads)
    @practice.practice_drills.find_by(drill: @drill).destroy
    redirect_to practice_path(@practice)
  end

  def set_practice
    @squads = @current_user.squads
    @squad = @squads.find_by(id: params[:squad_id])
    @practices = Practice.where(squad: @current_user.squads)
    @practice = @practices.find_by(id: params[:id])
  end
end
