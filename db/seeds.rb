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

concrete1 = URI.open("https://res.cloudinary.com/dulcgeiwe/image/upload/v1689193761/concrete_1_o4zrtg.jpg")
concrete2 = URI.open("https://res.cloudinary.com/dulcgeiwe/image/upload/v1689193767/concrete_2_abpzxi.jpg")
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

le_showcase1 = URI.open("https://res.cloudinary.com/dulcgeiwe/image/upload/v1689193827/le_showcase_1_wrtbjf.webp")
le_showcase2 = URI.open("https://res.cloudinary.com/dulcgeiwe/image/upload/v1689193833/le_showcase_2_rco2j2.jpg")
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

le_wanderlust1 = URI.open("https://res.cloudinary.com/dulcgeiwe/image/upload/v1689193867/le_wanderlust_1_nwt2vr.jpg")
le_wanderlust2 = URI.open("https://res.cloudinary.com/dulcgeiwe/image/upload/v1689193872/le_wanderlust_2_nlwjbi.jpg")
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

social_club1 = URI.open("https://res.cloudinary.com/dulcgeiwe/image/upload/v1689193925/social_club_1_cixcv6.webp")
social_club2 = URI.open("https://res.cloudinary.com/dulcgeiwe/image/upload/v1689193930/social_club_2_ukpo5w.jpg")
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


fabric1 = URI.open("https://res.cloudinary.com/dulcgeiwe/image/upload/v1689105492/fabric_1_vddbr1.webp")
fabric2 = URI.open("https://res.cloudinary.com/dulcgeiwe/image/upload/v1689105503/fabric_2_dcm4rh.jpg")
fabric = Venue.new(
  name: "Fabric",
  location: "77A Charterhouse St, Clerkenwell, London EC1M 6HJ, UK",
  description: "Fabric is one of London's premier venues and promoters that features weekly line-ups of some of the world's finest talent. The Fabric crew is generally on the ball in terms of running and providing quality events week after week. The FabricLIVE events on Friday feature breaks, drum and bass, while Saturday hosts the finest in European house and techno programmed by resident DJ Craig Richards.",
  price: 200
)
fabric.photos.attach(io: fabric1, filename: "fabric-1", content_type: "image/jpeg")
fabric.photos.attach(io: fabric2, filename: "fabric-2", content_type: "image/jpeg")
fabric.user = user1
fabric.save


ministry1 = URI.open("https://res.cloudinary.com/dulcgeiwe/image/upload/v1689105456/ministry_of_sound_1_wcyqih.jpg")
ministry2 = URI.open("https://res.cloudinary.com/dulcgeiwe/image/upload/v1689105462/ministry_of_sound_2_xsnn7d.png")
ministry = Venue.new(
  name: "Ministry of Sound",
  location: "103 Gaunt St, London SE1 6DP, UK",
  description: "Ministry of Sound first opened its doors in September 1991 and became the first club dedicated to house music. It quickly gained a reputation as a groundbreaking venue and played a significant role in spreading dance music's popularity around the world. The club is known for its exceptional sound quality, with its main room, The Box, featuring an award-winning sound system.",
  price: 300
)
ministry.photos.attach(io: ministry1, filename: "ministry-of-sound-1", content_type: "image/jpeg")
ministry.photos.attach(io: ministry2, filename: "ministry-of-sound-2", content_type: "image/jpeg")
ministry.user = user1
ministry.save


printworks1 = URI.open("https://res.cloudinary.com/dulcgeiwe/image/upload/v1689105412/printworks_1_lyb78l.avif")
printworks2 = URI.open("https://res.cloudinary.com/dulcgeiwe/image/upload/v1689105419/printworks_2_q1z5a3.jpg")
printworks = Venue.new(
  name: "Printworks London",
  location: "Surrey Quays Rd, London SE16 7PJ, UK",
  description: "Printworks London is a 5000-capacity licensed venue located within a former printing facility for the Metro and Evening Standard newspapers. It offers a unique space in London's Docklands and hosts a variety of events, combining industrial aesthetics with a vibrant atmosphere.",
  price: 400
)

printworks.photos.attach(io: printworks1, filename: "printworks-london-1", content_type: "image/jpeg")
printworks.photos.attach(io: printworks2, filename: "printworks-london-2", content_type: "image/jpeg")
printworks.user = user1
printworks.save


egg1 = URI.open("https://res.cloudinary.com/dulcgeiwe/image/upload/v1689105239/egglondon_1_lg08gf.jpg")
egg2 = URI.open("https://res.cloudinary.com/dulcgeiwe/image/upload/v1689105245/egg_london_2_qcgfly.jpg")
egg = Venue.new(
  name: "Egg London",
  location: "200 York Way, Kings Cross, London N7 9AX, UK",
  description: "Egg London is a unique venue located in a Victorian warehouse in Kings Cross. It offers a variety of indoor and outdoor spaces and operates with a 24-hour license, providing a vibrant and dynamic experience for clubbers.",
  price: 200
)
egg.photos.attach(io: egg1, filename: "egg-london-1", content_type: "image/jpeg")
egg.photos.attach(io: egg2, filename: "egg-london-2", content_type: "image/jpeg")
egg.user = user1
egg.save


xoyo1 = URI.open("https://res.cloudinary.com/dulcgeiwe/image/upload/v1689105131/xoyo_1_mwsmmy.avif")
xoyo2 = URI.open("https://res.cloudinary.com/dulcgeiwe/image/upload/v1689105135/xoyo_2_cp1pvf.jpg")
xoyo = Venue.new(
  name: "XOYO",
  location: "32-37 Cowper St, Shoreditch, London EC2A 4AP, UK",
  description: "XOYO is one of London's most well-respected clubs, known for its consistent and credible music policy. It hosts renowned DJs and artists from around the world, featuring a diverse range of genres. Located in the heart of Shoreditch, XOYO offers a multi-level venue with an expertly-tuned soundsystem and a quarterly residency series.",
  price: 200
)
xoyo.photos.attach(io: xoyo1, filename: "xoyo-1", content_type: "image/jpeg")
xoyo.photos.attach(io: xoyo2, filename: "xoyo-2", content_type: "image/jpeg")
xoyo.user = user1
xoyo.save

de_school1 = URI.open("https://res.cloudinary.com/dulcgeiwe/image/upload/v1689194299/de_school_1_m2jgjw.jpg")
de_school2 = URI.open("https://res.cloudinary.com/dulcgeiwe/image/upload/v1689194311/de_school_2_maj0wy.jpg")
de_school = Venue.new(
  name: "De School",
  location: "Doctor Jan van Breemenstraat 1, 1056 AB Amsterdam, Netherlands",
  description: "De School is a popular club in Amsterdam, known for its underground music scene and diverse lineup of DJs. It is located in a former school building and offers a unique and immersive clubbing experience.",
  price: 150
)
de_school.photos.attach(io: de_school1, filename: "de_school-1", content_type: "image/jpeg")
de_school.photos.attach(io: de_school2, filename: "de_school-2", content_type: "image/jpeg")
de_school.user = user1
de_school.save

shelter1 = URI.open("https://res.cloudinary.com/dulcgeiwe/image/upload/v1689194374/shelter_1_yr4bbw.jpg")
shelter2 = URI.open("https://res.cloudinary.com/dulcgeiwe/image/upload/v1689194380/shelter_2_iiixnl.jpg")
shelter = Venue.new(
  name: "Shelter",
  location: "Overhoeksplein 3, 1031 KS Amsterdam, Netherlands",
  description: "Shelter is a renowned club in Amsterdam, offering a cutting-edge sound system and a focus on underground electronic music. It features both local and international DJs, providing an unforgettable clubbing experience.",
  price: 180
)
shelter.photos.attach(io: shelter1, filename: "shelter-1", content_type: "image/jpeg")
shelter.photos.attach(io: shelter2, filename: "shelter-2", content_type: "image/jpeg")
shelter.user = user1
shelter.save

melkweg1 = URI.open("https://res.cloudinary.com/dulcgeiwe/image/upload/v1689194422/melkweg_2_ezzvpb.jpg")
melkweg2 = URI.open("https://res.cloudinary.com/dulcgeiwe/image/upload/v1689194415/melkweg_1_hpsjll.jpg")
melkweg = Venue.new(
  name: "Melkweg",
  location: "Lijnbaansgracht 234A, 1017 PH Amsterdam, Netherlands",
  description: "Melkweg is a versatile music venue in Amsterdam, hosting a wide range of performances including live music concerts, club nights, and cultural events. It has multiple halls and a vibrant atmosphere.",
  price: 120
)
melkweg.photos.attach(io: melkweg1, filename: "melkweg-1", content_type: "image/jpeg")
melkweg.photos.attach(io: melkweg2, filename: "melkweg-2", content_type: "image/jpeg")
melkweg.user = user1
melkweg.save

claire1 = URI.open("https://res.cloudinary.com/dulcgeiwe/image/upload/v1689194471/claire_1_adxshn.webp")
claire2 = URI.open("https://res.cloudinary.com/dulcgeiwe/image/upload/v1689194476/claire_2_asfkvz.jpg")
claire = Venue.new(
  name: "Claire",
  location: "Rembrandtplein 17, 1017 CT Amsterdam, Netherlands",
  description: "Claire is a vibrant and intimate club located in the heart of Amsterdam. It showcases a variety of electronic music genres and hosts both renowned and emerging artists, offering an energetic and inclusive clubbing experience.",
  price: 100
)
claire.photos.attach(io: claire1, filename: "claire-1", content_type: "image/jpeg")
claire.photos.attach(io: claire2, filename: "claire-2", content_type: "image/jpeg")
claire.user = user1
claire.save

paradiso1 = URI.open("https://res.cloudinary.com/dulcgeiwe/image/upload/v1689194541/paradiso_2_br8lmb.jpg")
paradiso2 = URI.open("https://res.cloudinary.com/dulcgeiwe/image/upload/v1689194534/paradiso_1_t4jbhc.jpg")
paradiso = Venue.new(
  name: "Paradiso",
  location: "Weteringschans 6-8, 1017 SG Amsterdam, Netherlands",
  description: "Paradiso is a legendary music venue and cultural center in Amsterdam, known for its diverse programming and iconic architecture. It hosts a wide range of events, including concerts, club nights, and theatrical performances.",
  price: 140
)
paradiso.photos.attach(io: paradiso1, filename: "paradiso-1", content_type: "image/jpeg")
paradiso.photos.attach(io: paradiso2, filename: "paradiso-2", content_type: "image/jpeg")
paradiso.user = user1
paradiso.save



puts "All done!"
