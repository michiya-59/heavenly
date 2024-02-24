# frozen_string_literal: true

class AddUniqueIndexToUsersLoginId < ActiveRecord::Migration[7.1]
  def change
    add_index :users, :login_id, unique: true
  end
end
