class ToolboxesController < ApplicationController
  def index
    @boxes = Toolbox.all

    if @boxes.blank?
      flash.now[:alert] = t("flash.toolboxes.norecords")
    end
  end

  def new
    @box = Toolbox.new
  end

  def show
    @box = Toolbox.find(params[:id])
  end

  def create
    @box = Toolbox.new(toolbox_params)

    if @box.save
      redirect_to toolboxes_path, notice: t("flash.toolboxes.create.success", name: @box.name)
    else
      render :new, error: t("flash.toolboxes.create.error", name: @box.name)
    end
  end

  def edit
    @box = Toolbox.find(params[:id])
  end

  def update
    @box = Toolbox.find(params[:id])

    if @box.update_attributes(toolbox_params)
      redirect_to toolboxes_path, notice: t("flash.toolboxes.update.success", name: @box.name)
    else
      render :edit, error: t("flash.toolboxes.update.error", name: @box.name)
    end
  end

  def destroy
    @box = Toolbox.find(params[:id])

    if @box.destroy
      redirect_to toolboxes_path, notice: t("flash.toolboxes.destroy.notice", name: @box.name)
    else
      redirect_to toolboxes_path, error: t("flash.toolboxes.destroy.error", name: @box.name)
    end
  end

  private
  def toolbox_params
    params.require(:toolbox).permit(:name, :owner, :description)
  end
end
