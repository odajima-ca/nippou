class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy, :doing, :done]

  # GET /tasks
  # GET /tasks.json
  def index
    @tasks = Task.all
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
  end

  # GET /tasks/new
  def new
    @task = Task.todo.new
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.todo.new(task_params)

    respond_to do |format|
      if @task.save
        format.html { redirect_to @task, notice: 'Task was successfully created.' }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to @task, notice: 'Task was successfully updated.' }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1/doing
  # PATCH/PUT /tasks/1/doing.json
  def doing
    respond_to do |format|
      if @task.doing!
        format.html { redirect_to tasks_url, notice: 'Task was successfully updated.' }
        format.json { redirect_to tasks_url, notice: 'Task was successfully updated.', format: :json }
      else
        format.html { redirect_to tasks_url, alert: 'Task was not successfully updated.' }
        format.json { redirect_to tasks_url, alert: 'Task was successfully updated.', format: :json }
      end
    end
  end

  # PATCH/PUT /tasks/1/done
  # PATCH/PUT /tasks/1/done.json
  def done
    respond_to do |format|
      if @task.done!
        format.html { redirect_to tasks_url, notice: 'Task was successfully updated.' }
        format.json { redirect_to tasks_url, notice: 'Task was successfully updated.', format: :json }
      else
        format.html { redirect_to tasks_url, alert: 'Task was not successfully updated.' }
        format.json { redirect_to tasks_url, alert: 'Task was successfully updated.', format: :json }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_url, notice: 'Task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:category_id, :name, :description, :status, :completed_at)
    end
end
