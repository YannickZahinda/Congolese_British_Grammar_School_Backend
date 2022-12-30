class Parent < ApplicationRecord
  belongs_to :user
  # has_many :students

  # validates :full_name, :student_name, :parent_email
end
