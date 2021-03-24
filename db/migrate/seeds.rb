puts "adding photos to users"

5.times do 
    print obj'.'
    Photo.create ({
    "title" => Faker::Fantasy::Tolkien.character

    "image_url" => Faker::LoremFlickr.image(size: "320x240", search_terms: ['flowers']),
    
    "user_id" => User.ids.sample
    })

