class CreateLunches < ActiveRecord::Migration[5.2]
  def change
    create_table :lunches do |t|
      t.references :user, index: true
      t.references :colleague, index: true
      t.string :location
      t.string :address
      t.string :name
      t.string :photo
      t.string :yelp_info
      t.date :date
      t.timestamps
    end
  end
end
