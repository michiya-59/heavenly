# frozen_string_literal: true

class LearnCategoriesController < ApplicationController
  before_action :set_learn_category, only: %i(edit update)

  def index
    @learn_category = LearnCategory.new
    @learn_categories = LearnCategory.order(order_num: :asc)
    @unused_order_nums, = get_unused_order_nums("learn_category", learn_info: nil)
  end

  def edit
    @unused_order_nums, @learn_category = get_unused_order_nums("learn_category", learn_info: @learn_category)
  end

  def create
    @learn_category = LearnCategory.new(learn_category_params)

    if @learn_category.save
      flash[:success] = "学びのカテゴリーを登録しました。"
    else
      flash[:form_error] = @learn_category.errors.full_messages
    end
    redirect_to learn_categories_path
  end

  def update
    # 学習コンテンツの削除
    if learn_category_params[:delete_learn] == "1"
      @learn_category.destroy
      flash[:success] = "学びのカテゴリーを削除しました。"
      redirect_to learn_categories_path
      return
    end

    if @learn_category.update(learn_category_params)
      flash[:success] = "学びのカテゴリーを登録しました。"
      redirect_to learn_categories_path
    else
      render :edit
    end
  end

  # def destroy
  #   @learn_category.destroy
  #   flash[:success] = "学びのカテゴリーを削除しました。"
  #   redirect_to learn_categories_path
  # end

  private

  def learn_category_params
    params.require(:learn_category).permit(:name, :order_num, :delete_learn)
  end

  def set_learn_category
    @learn_category = LearnCategory.find(params[:id])
  end
end
