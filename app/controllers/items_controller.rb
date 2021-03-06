class ItemsController < ApplicationController
  def index
    @items = Item.all

    if @items.blank?
      flash.now[:alert] = t("flash.items.norecords")
    end
  end

  def new
    @item = Item.new
    @categories = Category.all
    @tools = Toolbox.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def create
    @item = Item.new(item_params)

    if @item.save
      redirect_to items_path, notice: t("flash.items.create.success", name: @item.name)
    else
      render :edit, error: t("flash.items.create.error", name: @item.name)
    end
  end

  def edit
    @item = Item.find(params[:id])
    @categories = Category.all
    @tools = Toolbox.all
  end

  def update
    @item = Item.find(params[:id])

    if @item.update_attributes(item_params)
      redirect_to items_path, notice: t("flash.items.update.success", name: @item.name)
    else
      render :edit, error: t("flash.item.update.error", name: @item.name)
    end
  end

  def destroy
    @item = Item.find(params[:id])

    if @item.destroy
      redirect_to items_path, notice: t("flash.items.destroy.notice")
    else
      redirect_to items_path, error: t("flash.items.destroy.error")
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :quantity, :useful_for, :category_id, :toolbox_id)
  end
end
