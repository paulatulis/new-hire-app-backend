class NotesController < ApplicationController
    def create
		@task = Task.find(params[:note][:task_id])
        @note = Note.new( user: @user, task: @task )

		if @note.save
			render json: { task: TaskSerializer.new(@task) }, status: :accepted
		else
			render json: { errors: @notes.errors.full_messages }, status: :declined
		end
	end
end
