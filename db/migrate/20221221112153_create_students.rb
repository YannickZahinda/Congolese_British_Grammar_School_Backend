class CreateStudents < ActiveRecord::Migration[7.0]
  def change
    create_table :students do |t|
      t.string :roll_number
      t.string :first_name
      t.string :parent
      t.string :street_address
      t.string :phone_number

      t.timestamps
    end
  end
end
