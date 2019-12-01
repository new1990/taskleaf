class AddUserIdToTasks < ActiveRecord::Migration[5.2]
  # DB上でUserとTaskを紐づける
  def up
    # 今まで作ったタスクを全て削除
    execute 'DELETE FROM tasks;'
    add_reference :tasks, :user, null: false, index: true
  end

  def down 
    remove_reference :tasks, :user, index: true
  end
end
