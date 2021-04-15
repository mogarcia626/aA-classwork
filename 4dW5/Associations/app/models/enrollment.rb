# == Schema Information
#
# Table name: enrollments
#
#  id         :bigint           not null, primary key
#  course_id  :integer
#  student_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Enrollment < ApplicationRecord

    validates :id, :student_id, :course_id, presence: true

   has_many( :users,
    primary_key: :id, 
    foreign_key: :student_id,
    class_name: :User )

    has_many( :courses,
        primary_key: :id,
        foreign_key: :course_id,
        class_name: :Course
    )
    

end
