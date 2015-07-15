class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :name
      t.string :email
      t.string :about
      t.float :gpa, default: 0.0
      t.string, :gender
      t.belongs_to :account

      t.timestamps null: false
    end
  end
end
