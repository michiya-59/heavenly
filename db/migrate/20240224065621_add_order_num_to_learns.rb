# frozen_string_literal: true

class AddOrderNumToLearns < ActiveRecord::Migration[7.1]
  def change
    add_column :learns, :order_num, :integer
  end
end
