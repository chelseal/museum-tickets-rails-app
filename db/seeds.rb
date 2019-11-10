for i in 0..19
    new_user = User.create(
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        password: "testing123",
        email: "test+#{i}@gmail.com"
        )

        #creates 1 museum per user
    museum = new_user.build_museum(
        name: Faker::WorldCup.stadium,
        description: Faker::Lorem.paragraph,
        opening_time: "09:00:00",
        closing_time: "18:00:00",
        wheelchair_accessible: Faker::Boolean.boolean,
        street: Faker::Address.street_address,
        city: Faker::Nation.capital_city,
        country: Faker::Address.country,
        )
    
    museum.save

    temp_museum_file = Down.download(Faker::LoremPixel.image + "?random=" + rand(1..1000).to_s)
    museum.pic.attach(io: temp_museum_file, filename: File.basename(temp_museum_file.path))

    puts "created museum #{museum.name}"
end

#brings an array of Musum table ids
museum_ids = Museum.pluck(:id)

styles = [
    { name: "Abstract" },
    { name: "Abstract Expressionism" },
    { name: "Conceptual" },
    { name: "Cubist" },
    { name: "Expressionist" },
    { name: "Fauvism"},
    { name: "Figurative"},
    { name: "Impressionist"},
    { name: "Minimalsim"},
    { name: "Naive"},
    { name: "Photorealist"},
    { name: "Pop"},
    { name: "Primitive"},
    { name: "Realism"},
    { name: "Representational"},
    { name: "Surrealism"}
]

if Style.count == 0
    for style in styles
        style = Style.create(style)
    end
end

style_ids = Style.pluck(:id)

40.times do |index|
    listing = Listing.create(
        title: Faker::Books::CultureSeries.culture_ship,
        name: Faker::Artist.name,
        description: Faker::Lorem.paragraph,
        start_date: Faker::Date.forward(days: 35),
        end_date: Faker::Date.forward(days: 53),
        curator: Faker::WorldCup.roster(country: 'Russia', type: 'coach'),
        exhibit_patron: Faker::JapaneseMedia::SwordArtOnline.real_name,
        photo_credit: Faker::BossaNova.artist,
        price: rand(2500..10000),
        museum_id: museum_ids.sample)

    temp_listing_file = Down.download(Faker::LoremPixel.image + "?random=" + rand(1..1000).to_s)
    listing.pic.attach(io: temp_listing_file, filename: File.basename(temp_listing_file.path))

    rand_styles = Style.where(id: style_ids.sample(rand(1..2)))
    listing.styles = rand_styles

#output in terminal"
    puts "created listing #{listing.title}"
end