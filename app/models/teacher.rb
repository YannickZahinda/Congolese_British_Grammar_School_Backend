class Teacher < ApplicationRecord
    belongs_to :user
    # has_many :students

    # validates :employee_code, :full_name, :incharge_class, :subject_handling, :phone_number
end
