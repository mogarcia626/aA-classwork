# == Schema Information
#
# Table name: courses
#
#  id            :bigint           not null, primary key
#  name          :string
#  prereq_id     :integer
#  instructor_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class Course < ApplicationRecord

    validates :name, presence: true

    has_many( :enrollments,
        primary_key: :id,
        foreign_key: :course_id,
        class_name: :Enrollment
    )

    has_many( :enrolled_students,
        through: :enrollments,
        source: :users
    )

    belongs_to( :instructor,
        primary_key: :id,
        foreign_key: :instructor_id,
        class_name: :User
    )

    def prereq
        Course.find_by_id(prereq_id)
    end

end
