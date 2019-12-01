
class ApplicationController < ActionController::Base
    # ログインしているユーザーを取得する処理は頻繁に必要なため、すべてのコントローラーから利用できるようにする
    helper_method :current_user

    private

      def current_user
        @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
      end
end
