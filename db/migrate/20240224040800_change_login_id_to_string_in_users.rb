# frozen_string_literal: true

class ChangeLoginIdToStringInUsers < ActiveRecord::Migration[7.1]
  def change
    change_column :users, :login_id, :string
  end
end
