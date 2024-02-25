# frozen_string_literal: true

class AddOrderNumToLearnCategoies < ActiveRecord::Migration[7.1]
  def change
    add_column :learn_categories, :order_num, :integer
  end
end
