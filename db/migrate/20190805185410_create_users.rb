class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :photo
      t.string :team
      t.string :password_digest
      t.string :first_name
      t.string :last_name
      t.string :username
      t.string :title
      t.text :bio
      t.date :start_date
      t.string :location
      t.boolean :manager
      t.timestamps
    end
  end
end
