class UpdateNotesTasks < ActiveRecord::Migration[5.2]
  def change
    remove_reference :notes, :user, index: true
  end
end
