# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Random date in the future (up to maximum of N days)
# Keyword arguments: days

Listings
:title Faker::Books::CultureSeries.culture_ship
:name Faker::Artist.name
:description Faker::Lorem.paragraphs
:start_date = Faker::Date.forward(days: 35)
:end_date = Faker::Date.forward(days: 53)
:curator = Faker::WorldCup.roster(country: 'Russia', type: 'coach')
:exhibit_patron = Faker::JapaneseMedia::SwordArtOnline.real_name
:photo_credit Faker::BossaNova.artist
:museum_id
:price
:status

:pic Faker::LoremPixel.image

Museums
:name Faker::WorldCup.stadium
:description Faker::Lorem.paragraphs
:opening_time 
:closing_time
:wheelchair_accessible Faker::Boolean.boolea
:street Faker::Address.street_address
:city Faker::Nation.capital_city
:country Faker::Address.country
:user_id

styles = [
    { name: "Abstract", kind: "style" },
    { name: "Abstract Expressionism", kind: "style" },
    { name: "Conceptual", kind: "style" },
    { name: "Cubist", kind: "style" },
    { name: "Expressionist", kind: "style" },
    { name: "Fauvism", kind: "style"},
    { name: "Figurative", kind: "style"},
    { name: "Impressionist", kind: "style"},
    { name: "Minimalsim", kind: "style"},
    { name: "Naive", kind: "style"},
    { name: "Photorealist", kind: "style"},
    { name: "Pop", kind: "style"},
    { name: "Primitive", kind: "style"},
    { name: "Realism", kind: "style"},
    { name: "Representational", kind: "style"},
    { name: "Surrealism", kind: "style"}
]

status = [
    { name: "draft", kind: "status" },
    { status: "published", kind: "status"}
]

if Styles.count == 0
    for style in styles
        style = Style.create(style)

if Listings.count == 0
    for listing in listings
        listing = Listing.create(listing)

        temp_listing_pic = Down.download(Faker::LoremPixel.image + "?random=" + rand(1..1000).to_s)
        ingredient.pic.attach(io: temp_listing_pic, filename: File.basename(temp_listing_pic.path))

        puts "created listing #{listing.name}"
    end
end

style_ids = Style.where(kind: "style").pluck(:id)

for i in 1..10
    listing = Listing.create(
        
        title: Faker::Books::CultureSeries.culture_ship,
        name: Faker::Artist.name,
        description: Faker::Lorem.paragraphs,
        start_date: Faker::Date.forward(days: 35),
        end_date: Faker::Date.forward(days: 53),
        curator: Faker::WorldCup.roster(country: 'Russia', type: 'coach'),
        exhibit_patron: Faker::JapaneseMedia::SwordArtOnline.real_name,
        photo_credit: Faker::BossaNova.artist,
        museum_id: ,
        price: rand(2500..10000),
        status: 
    )

    temp_museum_file = Down.download(Faker::LoremPixel.image + "?random=" + rand(1..1000).to_s)
    museum.pic.attach(io: temp_museum_file, filename: File.museumname(temp_museum_file.path))

    puts "created museum #{museum.name}"

    museum_name_id = museum_ids.sample
    museum_flavour_ids = flavour_ids.sample(rand(1..flavour_ids.length))
    milkshake_topping_ids = topping_ids.sample(rand(1..topping_ids.length))

    listing_ids = [museum_name_id] + museum_flavour_ids + milkshake_topping_ids

    listings = Listing.where(id: listing_ids)
    museum.listings = listings

    puts "added listing to museum #{listening_ids}"
end

#Users first name and last name

