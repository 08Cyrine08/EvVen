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
  location: Faker::Address.full_address,
  description: "Are you looking for the perfect place to tie the knot? Look no further than the Rose Garden, a stunning
  wedding venue that will make your special day unforgettable. The Rose Garden offers a beautiful outdoor setting with
  lush greenery, fragrant roses, and a romantic gazebo. Whether you want a small intimate ceremony or a lavish reception,
  we can accommodate your needs and budget. You and your guests will enjoy our delicious catering, professional service,
  and elegant decor. Contact us today to book a tour and see why the Rose Garden is the best choice for your wedding.
  ",
  price: 1000
)
wedding.photos.attach(io: URI.open('https://res.cloudinary.com/dulcgeiwe/image/upload/v1688141662/1mr7y1ig3cl640vsqvg78mabgapv.jpg'), filename: 'image.jpg')
# wedding.photos.attach(io: wedding1, filename: "wedding-1", content_type: "image/png")
# wedding.photos.attach(io: wedding2, filename: "wedding-2", content_type: "image/png")
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

puts "All done!"
