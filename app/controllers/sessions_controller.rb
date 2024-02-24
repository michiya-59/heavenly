# frozen_string_literal: true

class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(login_id: params[:login_id])
    if user
      if user.status == 1
        if user.authenticate(params[:password])
          login user
          # redirect_to root_path
        else
          @error_msg = "ログインIDまたはパスワードが間違っています。"
          render :new
        end
      else
        @error_msg = "退会済みのアカウントのため<br>ログインできません。"
        render :new
      end
    else
      @error_msg = "入力に誤りがあります。ID・パスワードを再度ご確認ください。"
      render :new
    end
  end
end
