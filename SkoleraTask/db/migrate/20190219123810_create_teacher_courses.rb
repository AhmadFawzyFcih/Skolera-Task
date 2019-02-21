class CreateTeacherCourses < ActiveRecord::Migration[5.1]
  def change
    create_table :teacher_courses do |t|
      t.integer :teacher_id, :null => false
      t.integer :course_id, :null => false

      t.timestamps
    end
    add_index("teacher_courses", "teacher_id")
    add_index("teacher_courses", "course_id")
  end
end
