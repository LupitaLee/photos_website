puts "adding photos to users"

5.times do 
    Photo.create ({

    "photo_1" => Faker::LoremFlickr.image(size: "320x240", search_terms: ['flowers']),
    "photo_2" => Faker::LoremFlickr.image(size: "320x240", search_terms: ['sports']),
    "photo_3" => Faker::LoremFlickr.image(size: "320x240", search_terms: ['animals']),
    "photo_4" => Faker::LoremFlickr.image(size: "320x240", search_terms: ['mountains']),
    "photo_5" => Faker::LoremFlickr.image(size: "320x240", search_terms: ['sun']),

    })

