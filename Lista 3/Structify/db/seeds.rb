# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
genres = Genre.create([
                          {descriptor: 'Pop'},
                          {descriptor: 'Rock'},
                          {descriptor: 'Sertanejo'},
                          {descriptor: 'Funk'},
                          {descriptor: 'Folk'},
                          {descriptor: 'Clássico'},
                          {descriptor: 'Country'},
                          {descriptor: 'Eletrônica'},
                          {descriptor: 'Experimental'},
                          {descriptor: 'Forró'},
                          {descriptor: 'Hip Hop'},
                          {descriptor: 'Rap'},
                          {descriptor: 'R&B'},
                          {descriptor: 'Infantil'},
                          {descriptor: 'Jazz'},
                          {descriptor: 'Soul'},
                          {descriptor: 'Pagode'}
                      ]
)

albums = Album.create( [
                           {name: 'The Dreaming', artist: 'Kate Bush'},
                           {name: 'Wish You Were Here', artist: 'Pink Floyd'},
                           {name: 'Xenossamba', artist: 'Satanique Samba Trio'},
                           {name: 'Yeezus', artist: 'Kanye West'}
                       ]
)

Song.create([
                {name: 'Sat In Your Lap', is_explicit: false, genre: genres[0], album: albums[0]},
                {name: 'There Goes A Tenner', is_explicit: false, genre: genres[0], album: albums[0]},
                {name: 'Pull Out The Pin', is_explicit: false, genre: genres[0], album: albums[0]},
                {name: 'Suspended In Gaffa', is_explicit: false, genre: genres[0], album: albums[0]},
                {name: 'Leave It Open', is_explicit: false, genre: genres[0], album: albums[0]},
                {name: 'The Dreaming', is_explicit: false, genre: genres[0], album: albums[0]},
                {name: 'Night Of The Swallow', is_explicit: false, genre: genres[0], album: albums[0]},
                {name: 'All The Love', is_explicit: false, genre: genres[0], album: albums[0]},
                {name: 'Houdini', is_explicit: false, genre: genres[0], album: albums[0]},
                {name: 'Get Out Of My House', is_explicit: false, genre: genres[0], album: albums[0]},
                {name: 'Shine On You Crazy Diamond (Pts. 1-5)', is_explicit: false, genre:genres[0], album: albums[1]},
                {name: 'Welcome to the Machine', is_explicit: false, genre: genres[0], album: albums[1]},
                {name: 'Have a Cigar', is_explicit: false, genre: genres[0], album: albums[1]},
                {name: 'Wish You Were Here', is_explicit: false, genre: genres[0], album: albums[1]},
                {name: 'Shine On You Crazy Diamond (Pts. 6-9)', is_explicit: false, genre: genres[0], album: albums[1]},
                {name: 'Altos Traumas', is_explicit: true, genre: genres[8], album: albums[2]},
                {name: 'Vendo Vultos', is_explicit: false, genre: genres[8], album: albums[2]},
                {name: 'Xenomorphus #1 (Lotsa Trauma)', is_explicit: false, genre: genres[8], album: albums[2]},
                {name: 'Xenomorphus #2', is_explicit: false, genre: genres[8], album: albums[2]},
                {name: 'Glisserata', is_explicit: false, genre: genres[8], album: albums[2]},
                {name: 'Samba de Todas as Notas', is_explicit: false, genre: genres[8], album: albums[2]},
                {name: 'Xenomorphus #3', is_explicit: false, genre: genres[8], album: albums[2]},
                {name: 'Xenomorphus #4', is_explicit: false, genre: genres[8], album: albums[2]},
                {name: 'On Sight', is_explicit: true, genre: genres[10], album: albums[3]},
                {name: 'Black Skinhead', is_explicit: true, genre: genres[10], album: albums[3]},
                {name: 'I Am A God', is_explicit: true, genre: genres[10], album: albums[3]},
                {name: 'New Slaves', is_explicit: true, genre: genres[10], album: albums[3]},
                {name: 'Hold My Liquor', is_explicit: true, genre: genres[10], album: albums[3]},
                {name: 'I\'m In It', is_explicit: true, genre: genres[10], album: albums[3]},
                {name: 'Blood On The Leaves', is_explicit: true, genre: genres[10], album: albums[3]},
                {name: 'Guilt Trip', is_explicit: true, genre: genres[10], album: albums[3]},
                {name: 'Send It Up', is_explicit: true, genre: genres[10], album: albums[3]},
                {name: 'Bound 2', is_explicit: true, genre: genres[10], album: albums[3]}
            ]
)