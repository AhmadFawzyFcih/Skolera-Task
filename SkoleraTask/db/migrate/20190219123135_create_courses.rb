class CreateCourses < ActiveRecord::Migration[5.1]
  def change
    create_table :courses do |t|
      t.string :name , :null => false
      t.text :description , :null => true
      t.integer :number_of_hours , :null => true , :default => 0
      t.integer :semester , :null => true , :default => 1
      t.integer :grade , :null => true , :default => 50
      
      t.timestamps
    end
  end
end
