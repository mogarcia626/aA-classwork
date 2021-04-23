# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(username: 'Leonardo')
User.create(username: 'Donatello')
User.create(username: 'Raphael')
User.create(username: 'Michelangelo')

Artwork.create(title:'Mona Lisa', image_url:'mona-lisa.frown', artist_id: 1)
Artwork.create(title:'Statue of David', image_url:'david.com', artist_id: 2)
Artwork.create(title:'Transfiguration', image_url:'transfiguration.com', artist_id: 3)
Artwork.create(title:'Sistine Chapel Ceiling', image_url:'ceiling.pope', artist_id: 4)

ArtworkShare.create(artwork_id: 1, viewer_id: 2)
ArtworkShare.create(artwork_id: 1, viewer_id: 3)
ArtworkShare.create(artwork_id: 1, viewer_id: 4)