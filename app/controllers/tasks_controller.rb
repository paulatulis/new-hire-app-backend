class TasksController < ApplicationController
    def index
        render json: Task.all
    end

    def show
        render json: Task.find(params[:id])
    end

    def create
        @task = Task.new(new_task_params)
        
        if @task.save
            render json: { task: TaskSerializer.new(@task) }, status: :accepted
        else
            render json: { errors: @task.errors.full_messages }, status: :unprocessable_entity
        end
    end

    private

    def new_task_params
        params.require(:task).permit(:title, :description, :due_date, :complete)
    end
end
