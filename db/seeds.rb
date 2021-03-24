puts "adding photos to users"

3.times do 
    Photo.create ({
    :title => Faker::Fantasy::Tolkien.character,

    :image_url => "https://source.unsplash.com/random/200x200?sig=#{(0..100).to_a.sample}",
    
    :description => Faker::Lorem.words,

    :user_id => User.ids.sample

    })
end

