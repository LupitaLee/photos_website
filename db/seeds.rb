puts "adding photos to users"

7.times do 
    Photo.create ({
    :title => Faker::Fantasy::Tolkien.character,

    :image_url => Faker::LoremFlickr.image(size: "320x240", search_terms: ['flowers']),
    
    :description => Faker::Lorem.words,

    :user_id => User.ids.sample

    })
end

