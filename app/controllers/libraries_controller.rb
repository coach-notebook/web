class LibrariesController < ApplicationController
  before_action :set_library

  def safe_params
    params.require(:library).permit(:name, :notes)
  end

  def index
    @pagy, @libraries = pagy @libraries
  end

  def new
    @library = @libraries.build
    render template: "libraries/form"
  end

  def create
    @library = @libraries.create safe_params
    if @library.valid?
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
    @libraries = current_user.libraries
    @library = current_user.libraries.find_by(id: params[:id])
  end
end
