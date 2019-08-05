class CreateNotes < ActiveRecord::Migration[5.2]
  def change
    create_table :notes do |t|
      t.references :task, index: true
      t.references :user, index: true
      t.text :body
      t.timestamps
    end
  end
end
