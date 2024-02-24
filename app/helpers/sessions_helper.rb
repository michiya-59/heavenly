# frozen_string_literal: true

module SessionsHelper
  def login user
    session[:user_id] = user.id
    user.update_column(:last_login_dt, Time.zone.now)
  end

  def current_user
    return unless (user_id = session[:user_id])

    @current_user ||= User.find_by(id: user_id)
  end

  def logout
    current_user
    reset_session
    @current_user = nil
  end

  # ユーザーがログインしていればtrue、その他ならfalseを返す
  def logged_in?
    !current_user.nil?
  end
end
