
class ApplicationController < ActionController::Base
    # ログインしているユーザーを取得する処理は頻繁に必要なため、すべてのコントローラーから利用できるようにする
    helper_method :current_user
    # タスク管理機能の各アクションの前に処理するフィルタ
    before_action :login_required

    private

      def current_user
        @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
      end

      def login_required
        # アプリ内のすべてのアクションの処理前にユーザーがログイン済みかどうかのチェックが入り、ログイン済み出なかった場合はログイン画面を表示
        redirect_to login_path unless current_user
      end
end
