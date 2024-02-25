# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include(SessionsHelper)

  def get_unused_order_nums type, learn_info: nil
    if learn_info.present?
      all_order_nums = (1..20).to_a
      used_order_nums = if type == "learn_category"
                          LearnCategory.where.not(id: learn_info.id).pluck(:order_num)
                        else
                          Learn.where.not(id: learn_info.id).pluck(:order_num)
                        end
      unused_order_nums = all_order_nums - used_order_nums

      # 自分自身のorder_numが未使用の番号に含まれていなければ追加
      unless unused_order_nums.include?(learn_info.order_num)
        unused_order_nums << learn_info.order_num
      end
      unused_order_nums.sort!
      [unused_order_nums, learn_info]
    else
      available_order_nums = (1..20).to_a
      used_order_nums = if type == "learn_category"
                          LearnCategory.pluck(:order_num)
                        else
                          Learn.pluck(:order_num)
                        end
      unused_order_nums = available_order_nums - used_order_nums
      [unused_order_nums, ""]
    end
  end
end
