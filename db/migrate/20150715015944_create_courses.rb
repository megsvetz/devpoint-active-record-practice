class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name
      t.string :code
      t.date :start
      t.date :end
      t.belongs_to :account

      t.timestamps null: false
    end
  end
end
