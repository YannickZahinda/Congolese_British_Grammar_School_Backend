class Student < ApplicationRecord
    belongs_to :parents
    belongs_to :teachers
    has_many :teachers
end
