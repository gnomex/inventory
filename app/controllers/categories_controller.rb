class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(form_params)

    if @category.save
      flash[:notice] = t("flash.categories.create.notice", name: @category.name)
      redirect_to categories_path
    else
      render :new, error: t("flahs.categories.create.error", name: @category.name)
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update_attributes(params[:category])
      redirect_to category
    else
      render :edit, error: t("flash.category.errors.update")
    end
  end

  def destroy
    @category = Category.find(params[:id])

    if @category.destroy
      redirect_to categories_path, notice: t("flash.categories.destroy.notice", name: @category.name)
    else
      redirect_to categories_path, error: t("flash.categories.destroy.error", name: @category.name)
    end
  end

  private
  def form_params
    params.require(:category).permit(:name)
  end
end
