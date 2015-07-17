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
    @box = Toolbox.new(form_params)

    if @box.save
      flash[:notice] = t("flash.toolboxes.success")
      redirect_to toolboxes_path, error: t("flash.toolboxes.create.success")
    else
      render :new, error: t("flash.toolboxes.create.error")
    end
  end

  def edit
    @box = Toolbox.find(params[:id])
  end

  def update
    @box = Toolbox.find(params[:id])

    if @box.update_attributes(toolbox_params)
      redirect_to toolboxes_path, notice: t("flash.toolboxes.update.success")
    else
      render :edit, error: t("flash.toolboxes.update.error")
    end
  end

  def destroy
    @box = Toolbox.find(params[:id])

    if @box.destroy
      redirect_to toolboxes_path, notice: t("flash.toolboxes.destroy.notice")
    else
      redirect_to toolboxes_path, error: t("flash.toolboxes.destroy.error")
    end
  end

  private
  def toolbox_params
    params.require(:toolbox).permit(:name, :owner, :description)
  end
end
