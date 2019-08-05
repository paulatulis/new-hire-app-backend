class UpdateTasks < ActiveRecord::Migration[5.2]
  def change
    remove_reference :tasks, :colleague, index: true
  end
end
