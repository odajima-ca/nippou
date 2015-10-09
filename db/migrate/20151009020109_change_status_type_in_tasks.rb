class ChangeStatusTypeInTasks < ActiveRecord::Migration
  def change
    change_column :tasks, :status, :integer, null: false
  end
end
