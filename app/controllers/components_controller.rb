class ComponentsController < ApplicationController

  def index
    @components = Component.all

    if @components.blank?
      flash.now[:alert] = t("flash.components.norecords")
    end
  end

  def show
    @component = Component.find(params[:id])
  end

  def new
    @component = Component.new
    @categories = Category.all
  end

  def create
    @component = Component.new(form_params)

    @component.status = Hash["event".to_sym, "status"]

    if @component.save
      redirect_to components_path
    else
      render :new, error: t("flash.components.create.error")
    end
  end

  def edit
    @component = Component.find(params[:id])
  end

  def update
    @component = Component.find(params[:id])
    if @component.update_attributes(params[:component])
      redirect_to components_path
    else
      render :edit, error: t("flash.components.errors.update")
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
  def form_params
    params.require(:component).permit(:part_number, :stock, :description, :manufacturer, :datasheet, :image_link, :status, :category_id)
  end
end
