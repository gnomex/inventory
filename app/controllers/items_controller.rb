class ItemController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def show
    @item = Item.find(params[:id])
  end

  def create
    @item = Item.new(form_params)
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update_attributes(params[:item])
      redirect_to item
    else
      render :edit, error: t("flash.item.errors.update")
    end
  end

  def destroy
    @item = Item.find(params[:id])

    if @item.destroy
      redirect_to root_path, notice: t("flash.items.destroy.notice")
    else
      redirect_to root_path, error: t("flash.items.destroy.error")
    end
  end

  private
  def form_params
    params.require(:item).permit()
  end
end
