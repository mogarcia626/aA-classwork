# == Schema Information
#
# Table name: subs
#
#  id           :bigint           not null, primary key
#  title        :string           not null
#  description  :string           not null
#  moderator_id :integer          not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Sub < ApplicationRecord
    validates :title, :moderator_id, :description, presence: true
    validates :title, uniqueness: true


    has_many :posts,
        foreign_key: :sub_id,
        class_name: :Post
    
    belongs_to :moderator,
        foreign_key: :moderator_id,
        class_name: :User
end
