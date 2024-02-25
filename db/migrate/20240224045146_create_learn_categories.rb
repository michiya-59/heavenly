# frozen_string_literal: true

class CreateLearnCategories < ActiveRecord::Migration[7.1]
  def change
    create_table :learn_categories do |t|
      t.string :name

      t.timestamps
    end
  end
end
