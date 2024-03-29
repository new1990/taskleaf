class SessionsController < ApplicationController
  # ログイン画面を表示するためのアクションにlogin_requiredフィルタを実行しないようにする
  skip_before_action :login_required

  def new
  end

  def create
    # 送られてきたメールアドレスでユーザーを検索
    user = User.find_by(email: session_params[:email])
    # ユーザーが見つかった場合は送られてきたパスワードによる認証を行う
    if user&.authenticate(session_params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: 'ログインしました。'
    else
      render :new
    end
  end

  def destroy
    reset_session
    redirect_to root_path, notice: 'ログアウトしました。'
  end

  private

    def session_params
      params.require(:session).permit(:email, :password)
    end
end
