class LibrariesController < ApplicationController
  before_action :set_library, only: [:show, :update, :edit, :destory]

  def safe_params
    params.require(:library).permit(:name, :notes)
  end

  def index
    @pagy, @libraries = pagy Library.accessible_to(current_user)
  end

  def new
    @library = Library.new
    render template: "libraries/form"
  end

  def create
    @library = Library.create safe_params.merge(user: current_user)
    if @library.valid?
      current_user.access_controls.create(access_controlled: @library)
      flash[:success] = t("library.created")
      redirect_to @library
    else
      flash[:warning] = @library.errors.full_messages
      render template: "libraries/form"
    end
  end

  def edit
    render template: "libraries/form"
  end

  def update
    @library.update safe_params
    if @library.valid?
      flash[:success] = t("library.updated")
      redirect_to @library
    else
      flash[:warning] = @library.errors.full_messages
      render template: "libraries/form"
    end
  end

  def set_library
    @library = Library.accessible_to(current_user).find_by(id: params[:id])
    fail ActiveRecord::RecordNotFound unless @library
  end
end
