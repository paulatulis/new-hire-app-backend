class TasksController < ApplicationController
    def index
        render json: Task.all
    end

    def show
        render json: Task.find(params[:id])
    end

    def create
        @task = Task.new(task_params)
        @user = User.find(task_params[:user_id])

        if @task.save
            render json: @user, each_serializer: UserSerializer.new(@user), status: :accepted
        else
            render json: { errors: @task.errors.full_messages }, status: :unprocessable_entity
        end
    end

    def update
        @task = Task.find(params[:id])
        @user = User.find(task_params[:user_id])

        if @task.update(task_params)
            render json: @user, each_serializer: UserSerializer.new(@user), status: :accepted
		else
			render json: { errors: (errors << @user.errors.full_messages)}, status: :declined
		end
	end

    private

    def task_params
        params.require(:task).permit(:title, :description, :due_date, :complete, :user_id)
    end
end
