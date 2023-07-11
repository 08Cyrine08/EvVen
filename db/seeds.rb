# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "open-uri"
require "faker"

puts "Cleaning database"
Venue.destroy_all
User.destroy_all

puts "Creating users"

user1 = User.new(email: "test@test.com", password: "123456", first_name: "Barry", last_name: "Barnson")
user1.save

user2 = User.new(email: "test2@test.com", password: "123456", first_name: "Doyle", last_name: "Farrel")
user2.save

user3 = User.new(email: "test3@test.com", password: "123456", first_name: "Jessica", last_name: "Smith")
user3.save

puts "Creating venues"

wedding1 = URI.open("https://res.cloudinary.com/dulcgeiwe/image/upload/v1687977109/Wedding-house-1_j8te7v.jpg")
wedding2 = URI.open("https://res.cloudinary.com/dulcgeiwe/image/upload/v1687977109/Wedding-house-2_hrionv.jpg")
wedding = Venue.new(
  name: "Rose Garden",
  location: "Paris, France",
  description: "Are you looking for the perfect place to tie the knot? Look no further than the Rose Garden, a stunning
  wedding venue that will make your special day unforgettable. The Rose Garden offers a beautiful outdoor setting with
  lush greenery, fragrant roses, and a romantic gazebo. Whether you want a small intimate ceremony or a lavish reception,
  we can accommodate your needs and budget. You and your guests will enjoy our delicious catering, professional service,
  and elegant decor. Contact us today to book a tour and see why the Rose Garden is the best choice for your wedding.
  ",
  price: 1000
)
wedding.photos.attach(io: wedding1, filename: "wedding-1", content_type: "image/png")
wedding.photos.attach(io: wedding2, filename: "wedding-2", content_type: "image/png")
wedding.user = user1
wedding.save

open1 = URI.open("https://res.cloudinary.com/dulcgeiwe/image/upload/v1687977109/open-space-1_y91r8n.jpg")
open2 = URI.open("https://res.cloudinary.com/dulcgeiwe/image/upload/v1687977109/open-space-2_uu2vhu.jpg")
openspace = Venue.new(
  name: "Open Space",
  location: Faker::Address.full_address,
  description: "Are you looking for a place to enjoy live music with your friends and family? Look no further than
   Open Space, the ultimate concert venue for all your entertainment needs! Open Space is a spacious outdoor arena that
    can host any genre of music, from rock to pop, from jazz to classical. You can experience the thrill of seeing your
    favorite artists perform live, while enjoying the fresh air and nice view",
  price: 2000
)
openspace.photos.attach(io: open1, filename: "opens-1", content_type: "image/png")
openspace.photos.attach(io: open2, filename: "opens-2", content_type: "image/png")
openspace.user = user2
openspace.save

loungephoto = URI.open("https://res.cloudinary.com/dulcgeiwe/image/upload/v1687977109/Lounge-1_hby0di.webp")
lounge = Venue.new(
  name: "Lounge Bar",
  location: Faker::Address.full_address,
  description: "Looking for a place to relax and have fun? Come to the Lounge Bar, the best venue in town! Enjoy our
   delicious drinks, cozy atmosphere, and live music every night. Whether you want to chill with your friends, meet new
   people, or dance the night away, the Lounge Bar has something for everyone. Don't miss our happy hour specials and
   weekly events. Visit our website or call us to book your table today. The Lounge Bar, where the party never stops!",
  price: 1400.50
)
lounge.photos.attach(io: loungephoto, filename: "lounge-1", content_type: "image/png")
lounge.user = user1
lounge.save

cocktailphoto = URI.open("https://res.cloudinary.com/dulcgeiwe/image/upload/v1687977108/cocktail-party_xk1xft.jpg")
cocktail = Venue.new(
  name: "Cocktail bar",
  location: Faker::Address.full_address,
  description: "Are you looking for a fun and exciting way to spend your evenings? Do you love trying new and delicious
  cocktails made by expert mixologists? Then you should join the Cocktail Club, the hottest venue in town! The Cocktail
  Club is more than just a bar, it's a community of cocktail enthusiasts who enjoy socializing, learning, and tasting.
  Whether you're a beginner or a connoisseur, you'll find something to suit your palate and mood. Plus, you'll get
   access to exclusive events, discounts, and perks as a member.",
  price: 1200.20
)
cocktail.photos.attach(io: cocktailphoto, filename: "cocktailphoto", content_type: "image/png")
cocktail.user = user3
cocktail.save

rexclub1 = URI.open("https://res.cloudinary.com/dulcgeiwe/image/upload/v1689025883/rexclub_1_oveh4a.jpg")
rexclub2 = URI.open("https://res.cloudinary.com/dulcgeiwe/image/upload/v1689025904/rexclub_2_uftr3z.jpg")
rexclub = Venue.new(
  name: "The Rex Club",
  location: "5 Bd Poissonnière, 75002 Paris, France",
  description: "Started by Laurent Garnier in 1992, Paris’ Rex Club is one of
  the city’s oldest and longest-running spots for techno and house parties.
  With a fully lit stage, walls lined with booths and seating, and a dance
  floor that stretches all the way to the bar, Rex Club offers plenty of
  options for clubbers. Rex Club has undoubtedly been one of the strongest
  driving forces of the Parisian nightlife scene. Ever since its opening 30
  years ago, Rex Club has become the go-to place for those who are avid lovers
  of techno and electronic music. Even after so many years of being open and
  inviting all kinds of partygoers, Rex Club has kept its authenticity
  and simplicity intact. Not just in its décor, but everything about this club
  shines out on its simplistic nature; right from the drinks served, to the
  kind of music played, to the door policy. The club opens its doors from
  Wednesdays to Saturdays, and unlike other clubs, the door policy
  for Rex Club is refreshingly freeing. This is one of the few clubs in Paris
  which remains open until the wee hours of the morning (7 am, actually), so
  if you are one of those partygoers who love to end your night by saying hello
  to the sunrise, well, Rex Club is the place you want to be.",
  price: 300
)
rexclub.photos.attach(io: rexclub1, filename: "rexclub-1", content_type: "image/png")
rexclub.photos.attach(io: rexclub2, filename: "rexclub-2", content_type: "image/png")
rexclub.user = user1
rexclub.save

concrete1 = URI.open("https://res.cloudinary.com/dulcgeiwe/image/upload/v1689025883/rexclub_1_oveh4a.jpg")
concrete2 = URI.open("https://res.cloudinary.com/dulcgeiwe/image/upload/v1689025904/rexclub_2_uftr3z.jpg")
concrete = Venue.new(
  name: "Concrete",
  location: "69 Port De La Rapée, 75012 Paris, France",
  description: "Concrete is the best venue for techno and house music lovers in Paris. Located on a three-level boat docked on the Seine since 2011, the team throws parties that go all night or all day or both, soundtracked by French and international DJs. Concrete is open Friday, Saturday and occasionally for the 28-hour party-festival 'Samedimanche', running from Saturday 11pm through Monday morning 2am. The club also manages the Concrete Music record label, Hors Serie parties and the huge Weather Festival.",
  price: 500
)
concrete.photos.attach(io: concrete1, filename: "concrete-1", content_type: "image/png")
concrete.photos.attach(io: concrete2, filename: "concrete-2", content_type: "image/png")
concrete.user = user1
concrete.save

le_showcase1 = URI.open("https://res.cloudinary.com/dulcgeiwe/image/upload/v1689025883/rexclub_1_oveh4a.jpg")
le_showcase2 = URI.open("https://res.cloudinary.com/dulcgeiwe/image/upload/v1689025904/rexclub_2_uftr3z.jpg")
le_showcase = Venue.new(
  name: "Le Showcase",
  location: "Pont Alexandre III; Port des Champs Elysées; 75008; Paris; France",
  description: "Located underneath a bridge on the bank of the Seine in the heart of Paris, Showcase offers a crossover line up ranging from House & Techno to Hip Hop & Bass music. As one of the largest venues in Paris, Showcase regularly hosts both a range of international DJs and producers alongside the city's local talents.",
  price: 300
)
le_showcase.photos.attach(io: le_showcase1, filename: "le-showcase-1", content_type: "image/png")
le_showcase.photos.attach(io: le_showcase2, filename: "le-showcase-2", content_type: "image/png")
le_showcase.user = user1
le_showcase.save

le_wanderlust1 = URI.open("https://res.cloudinary.com/dulcgeiwe/image/upload/v1689025883/rexclub_1_oveh4a.jpg")
le_wanderlust2 = URI.open("https://res.cloudinary.com/dulcgeiwe/image/upload/v1689025904/rexclub_2_uftr3z.jpg")
le_wanderlust = Venue.new(
  name: "Le Wanderlust",
  location: "32 quai d'Austerlitz, 75013 Paris",
  description: "The Wanderlust is located in the heart of the Cité de la Mode et du Design, conceived by architects Jakob+Macfarlane. The venue offers a large terrace in Paris on which to dance or to relax, an exhibition and cultural space, an experimental restaurant, an outdoor and indoor night-club, open air cinéma, sports activities and kids workshops, designers markets...",
  price: 200
)
le_wanderlust.photos.attach(io: le_wanderlust1, filename: "le-wanderlust-1", content_type: "image/png")
le_wanderlust.photos.attach(io: le_wanderlust2, filename: "le-wanderlust-2", content_type: "image/png")
le_wanderlust.user = user1
le_wanderlust.save

social_club1 = URI.open("https://res.cloudinary.com/dulcgeiwe/image/upload/v1689025883/rexclub_1_oveh4a.jpg")
social_club2 = URI.open("https://res.cloudinary.com/dulcgeiwe/image/upload/v1689025904/rexclub_2_uftr3z.jpg")
social_club = Venue.new(
  name: "Social Club",
  location: "142 rue Montmartre, 75002 Paris",
  description: "Located in central Paris on the Rue Montmartre, Social Club is open every week from Tuesday to Saturday nights and is decorated in a self-proclaimed 'retrofuturist' style, painted completely black with strategically placed neon lights. The 500-capacity club is housed in the same building that used to print George Clemenceau's L'Aurore newspaper, and features a small stage at the end of the dance floor and two bars, one near the entrance and one near the dance floor. The music ranges, but house, techno, disco, electro and similar genres are usually on offer.",
  price: 400
)
social_club.photos.attach(io: social_club1, filename: "social-club-1", content_type: "image/png")
social_club.photos.attach(io: social_club2, filename: "social-club-2", content_type: "image/png")
social_club.user = user1
social_club.save


puts "All done!"
