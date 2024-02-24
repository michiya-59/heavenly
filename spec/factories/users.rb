# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    login_id{1}
    password_digest{"MyString"}
    status{1}
    name{"MyString"}
    last_login_dt{"2024-02-23 23:14:22"}
  end
end
