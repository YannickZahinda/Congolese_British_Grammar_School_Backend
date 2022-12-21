class CreateTeachers < ActiveRecord::Migration[7.0]
  def change
    create_table :teachers do |t|
      t.string :employee_code
      t.string :full_name
      t.string :incharge_class
      t.string :subject_handling
      t.string :phone_number

      t.timestamps
    end
  end
end
