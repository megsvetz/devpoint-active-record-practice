class CreateEnrollments < ActiveRecord::Migration
  def change
    create_table :enrollments do |t|
      t.belongs_to :student
      t.belongs_to :course

      t.timestamps null: false
    end
  end
end
