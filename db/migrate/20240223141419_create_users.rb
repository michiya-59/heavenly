# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.integer :login_id
      t.string :password_digest
      t.integer :status
      t.string :name
      t.datetime :last_login_dt

      t.timestamps
    end
  end
end
