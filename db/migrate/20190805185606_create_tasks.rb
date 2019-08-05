class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.references :user, index: true
      t.references :colleague, index: true
      t.string :title
      t.string :description
      t.date :due_date
      t.boolean :complete
      t.timestamps
    end
  end
end
