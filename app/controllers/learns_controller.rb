# frozen_string_literal: true

class LearnsController < ApplicationController
  before_action :set_learn_category_id, only: %i(index)
  before_action :load_learn_data, only: %i(index edit update)
  before_action :find_learn_data, only: %i(edit update)

  def index
    @learn = Learn.new
    @learn_category_name = LearnCategory.select(:name)&.find(params[:id])&.name
    @unused_order_nums, = get_unused_order_nums("learn", learn_info: nil)
  end

  def edit
    @unused_order_nums, = get_unused_order_nums("learn", learn_info: @learn)
  end

  def create
    # current_userのIDは自動的にセットされる
    @learn = current_user.learns.build(learn_params)
    @learn.learn_category_id = session[:learn_category_id] if session[:learn_category_id].present?

    if @learn.save
      CompressVideoJob.perform_later(@learn.video_file.blob) if @learn.video_file.attached?
      flash[:success] = "学びの資料を登録しました。"
    else
      flash[:form_error] = @learn.errors.full_messages
    end

    if session[:admin_learn_page].present? && session[:search_learn_year].present? && session[:search_learn_month].present?
      redirect_to learns_path(id: session[:learn_category_id], page: session[:admin_learn_page], search_month: session[:search_learn_month], search_year: session[:search_learn_year])
    else
      redirect_to learns_path(id: session[:learn_category_id])
    end
  end

  def update
    # 学習コンテンツの削除
    if learn_params[:delete_learn] == "1"
      @learn.destroy
      flash[:success] = "学びの資料を削除しました。"
      redirect_to learns_path(id: session[:learn_category_id])
      return
    end

    # ファイルの削除
    @learn.document_file.purge if learn_params[:remove_document_file] == "1"
    @learn.video_file.purge if learn_params[:remove_video_file] == "1"

    if @learn.update(learn_params)
      flash[:success] = "学びのカテゴリーを編集しました。"
      redirect_to learns_path(id: session[:learn_category_id])
    else
      render :edit
    end
  end

  # def destroy
  #   @learn.destroy
  #   flash[:success] = "学びの資料を削除しました。"
  #   redirect_to learns_path(id: session[:learn_category_id])
  # end

  private

  def learn_params
    params.require(:learn).permit(:name, :document_file, :video_file, :learn_category_id, :user_id, :remove_document_file, :remove_video_file, :order_num, :delete_learn)
  end

  def set_learn_category_id
    return if params[:id].blank?

    session[:learn_category_id] = params[:id].to_i
  end

  def load_learn_data
    @learn_infos = Learn.where(learn_category_id: session[:learn_category_id]).order(:order_num)
  end

  def find_learn_data
    @learn = Learn.find(params[:id])
  end
end
