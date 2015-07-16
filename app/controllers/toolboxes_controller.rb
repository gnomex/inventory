class TolboxesController < ApplicationController
  def index
    @toolboxes = Toolbox.all
  end

  def new
    @box = Toolbox.new
  end

  def show
    @box = Toolbox.find(params[:id])
  end

  def create
    @box = Toolbox.new(form_params)
  end

  def edit
    @box = Toolbox.find(params[:id])
  end

  def update
    @box = Toolbox.find(params[:id])
    if @box.update_attributes(params[:box])
      redirect_to box
    else
      render :edit, error: t("flash.box.errors.update")
    end
  end

  def destroy
    @box = Toolbox.find(params[:id])

    if @box.destroy
      redirect_to root_path, notice: t("flash.toolboxes.destroy.notice")
    else
      redirect_to root_path, error: t("flash.toolboxes.destroy.error")
    end
  end

  private
  def form_params
    params.require(:box).permit()
  end
end
