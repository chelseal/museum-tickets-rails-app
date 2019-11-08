if ENV['RAILS_ENV'] == "development"

    for i in 0..2
        new_user = User.create(
            first_name: Faker::Name.first_name,
            last_name: Faker::Name.last_name,
            password: "testing123",
            email: "test+#{i}@gmail.com"
            )

            #creates 1 museum per user
        museum = new_user.create_museum(
            name: Faker::WorldCup.stadium,
            description: Faker::Lorem.paragraph,
            opening_time: "09:00:00",
            closing_time: "18:00:00",
            wheelchair_accessible: Faker::Boolean.boolean,
            street: Faker::Address.street_address,
            city: Faker::Nation.capital_city,
            country: Faker::Address.country,
            ) 

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

    2.times do |index|
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
            status: rand(0..1),
            museum_id: museum_ids.sample)

        #changes ot listing
        temp_listing_file = Down.download(Faker::LoremPixel.image + "?random=" + rand(1..1000).to_s)
        listing.pic.attach(io: temp_listing_file, filename: File.basename(temp_listing_file.path))

        rand_styles = Style.where(id: style_ids.sample(rand(1..3)))
        listing.styles = rand_styles

    #at end of loop and before end add puts
        puts "created listing #{listing.title}"
    end

end

if ENV['RAILS_ENV'] == "production"

    for i in 0..2
        #creates users
        new_user = User.create(
            first_name: Faker::Name.first_name,
            last_name: Faker::Name.last_name,
            password: "testing11!",
            email: "test+#{i}@gmail.com"
            )

        #creates 1 museum per user
        museum = new_user.create_museum(
            name: Faker::WorldCup.stadium,
            description: Faker::Lorem.paragraph,
            opening_time: "09:00:00",
            closing_time: "18:00:00",
            wheelchair_accessible: Faker::Boolean.boolean,
            street: Faker::Address.street_address,
            city: Faker::Nation.capital_city,
            country: Faker::Address.country,
            ) 

            Zeitz Museum of Contemporary Art Cape Town
            National Gallery of Canada in Ottawa
            Tate Modern in London
            The Metropolitan Museum Of Art in New York City
            Mauritshuis in The Hague, Netherlands
            The National Palace Museum in Taipei
            The Museum Egyptian Antiquities in Cairo
            Kunsthistorisches Museum in Vienna
            Museo de Arte de Puerto Rico
            The San Francisco Museum of Modern Art San Francisco
            The Art Institute of Chicago
            Museo Larco in Lima
            The Musée du Louvre in Paris
            The Museum of Modern Art New York City


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

    2.times do |index|
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
            status: rand(0..1),
            museum_id: museum_ids.sample)

        #changes ot listing
        temp_listing_file = Down.download(Faker::LoremPixel.image + "?random=" + rand(1..1000).to_s)
        listing.pic.attach(io: temp_listing_file, filename: File.basename(temp_listing_file.path))

        rand_styles = Style.where(id: style_ids.sample(rand(1..3)))
        listing.styles = rand_styles

    #at end of loop and before end add puts
        puts "created listing #{listing.title}"
    end

end

