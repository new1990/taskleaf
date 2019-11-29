class TasksController < ApplicationController
  def index
  end

  def show
  end

  def new
    @task = Task.new
  end

  def edit
  end

  def create
    # 安全化されたtaskパラメータをtask_paramsメソッドで取得して、それを使ってTaskオブジェクトを作成する
    task = Task.new(task_params)
    task.save! # DBに保存
    # 一覧画面に遷移
    redirect_to tasks_url, notice: "タスク「#{task.name}」を登録しました。"
  end

  private

    # フォームからリクエストパラメーターとして送られてきた情報が想定通りの形であることをチェックし、nameとdesctiptionの情報だけを抜き取る
    # 不正なデータが登録・更新がされてしまうことを防ぐ
    def task_params
      params.require(:task).permit(:name, :desctiption)
    end
end
