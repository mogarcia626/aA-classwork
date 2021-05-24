class Todo < ApplicationRecord
    validates :body, :title, presence: true
    validates :done, inclusion: { in: [true, false] }

end


# t.string 'title', null: false
#       t.string 'body', null: false
#       t.boolean 'done', null: false
#       t.timestamps
#     end
