class CreateParents < ActiveRecord::Migration[7.0]
  def change
    create_table :parents do |t|
      t.string :full_name
      t.string :student_name
      t.string :parent_email

      t.timestamps
    end
  end
end
