class TaskMailer < ApplicationMailer
  # タスクの登録の通知メール
  def creation_email(task)
    @task = task
    mail(
        subject: 'タスク作成完了メール',
        to: 'user@example.com',
        from: 'taskleaf@example.com'
    )
  end
end
