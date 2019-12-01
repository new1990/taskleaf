class TasksController < ApplicationController
  def index
    # 一覧のための全タスクデータを取得(ビューで使うためインスタンス変数)
    @tasks = Task.all
  end

  def show
    # 詳細画面に表示するためのTaskオブジェクトを取得
    # find: モデルオブジェクトに対応するレコードをDBから検索する
    # params[:id]：リクエストパラメーターから得られるid, つまりリクエストされたURL"tasks/[タスクのid]"の[タスクのid]部分が格納される
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    # 安全化されたtaskパラメータをtask_paramsメソッドで取得して、それを使ってTaskオブジェクトを作成する
    # @をつけることにより、エラーが発生しても入力した内容がフォームにそのまま残る
    @task = Task.new(task_params)
    if @task.save # DBに保存 バリデーションをつけたので、!がいらなくなった
      # 一覧画面に遷移
      redirect_to tasks_url, notice: "タスク「#{@task.name}」を登録しました。"
    else
      # エラーの時は登録用のフォーム画面を再び表示してユーザーに再入力を促す
      render :new
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    # 編集対象のTaskオブジェクトを取得
    task = Task.find(params[:id])
    # taskパラメータの代入とDBへの保存
    task.update!(task_params)
    redirect_to task_url, notice: "タスク「#{task.name}」を更新しました。"
  end

  def destroy
    # 削除対象のTaskオブジェクトをDBから取得
    task = Task.find(params[:id])
    task.destroy
    redirect_to tasks_url, notice: "タスク「#{task.name}」を削除しました。"
  end

  private

    # フォームからリクエストパラメーターとして送られてきた情報が想定通りの形であることをチェックし、nameとdesctiptionの情報だけを抜き取る
    # 不正なデータが登録・更新がされてしまうことを防ぐ
    def task_params
      params.require(:task).permit(:name, :desctiption)
    end
end
