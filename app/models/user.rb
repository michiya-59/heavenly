# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  VALID_ALPHANUMERIC_REGEX = /\A[a-zA-Z0-9]+\z/
  validates :login_id, uniqueness: true, format: {with: VALID_ALPHANUMERIC_REGEX, message: "は半角英数字のみで入力してください。"}
  validates :password, presence: true
end
