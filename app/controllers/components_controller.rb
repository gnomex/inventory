class ComponentsController < ApplicationController

  def index
    @components = Component.all
  end

  def new
    @component = Component.new
  end

  def create
    @component = Component.new(form_params)

    if @component.save
      redirect_to components_path
    else
      render :new, error: t("flash.components.create.error")
    end
  end

  def edit
    @component = Component.find(params[:component])
  end

  def update
    @component = Component.find(params[:id])
    if @component.update_attributes(params[:component])
      redirect_to components_path
    else
      render :edit
    end
  end

  def destroy
    @component = Component.find(params[:id])
    if @component.destroy
      redirect_to root_path, notice: t("flash.components.destroy.notice")
    else
      redirect_to root_path, alert: t("flash.components.destroy.error")
    end
  end

  private
  def for_params
    params.require(:component).permit(:part_number, :stock, :description, :manufacturer, :datasheet, :image_link, :status)
  end
end
