class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

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

    if @category.update_attributes(category_params)
      redirect_to categories_path, notice: t("flash.category.update.success")
    else
      render :edit, error: t("flash.category.errors.update")
    end
  end

  def destroy
    @category = Category.find(params[:id])

    begin
      @category.destroy
      flash[:notice] = t("flash.categories.destroy.notice", name: @category.name)
    rescue ActiveRecord::DeleteRestrictionError => e
      @category.errors.add(:base, e)
      flash[:error] = "#{e}"
    ensure
      redirect_to categories_path
    end
  end

  private
  def category_params
    params.require(:category).permit(:name)
  end
end
