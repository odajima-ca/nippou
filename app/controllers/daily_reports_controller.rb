class DailyReportsController < ApplicationController
  def index
    @today = Date.today
    @todo_tasks = Task.todo
    @doing_tasks = Task.doing
    @done_tasks = Task.done.where(completed_at: @today.beginning_of_day..@today.end_of_day)
  end
end
