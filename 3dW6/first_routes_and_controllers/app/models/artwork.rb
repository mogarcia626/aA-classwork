class Artwork < ApplicationRecord

    validates :artist_id, uniqueness: {scope: :title} 

    belongs_to :artist,
    foreign_key: :artist_id,
    class_name: :User
    
end
