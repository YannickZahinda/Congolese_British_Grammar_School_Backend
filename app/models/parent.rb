class Parent < ApplicationRecord
  has_many :students

  # validates :full_name, :student_name, :parent_email
end
