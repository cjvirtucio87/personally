# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.destroy_all
Business.destroy_all
Bookmark.destroy_all

puts "Seeding a user.."
user = User.create!(
  email: 'virtucio.cj@gmail.com',
  password: 'foobar'
  )

puts "Done."

puts "Saving a business.."
user.create_business!(
city: "ROCHESTER",
location_start_date: "2003-01-01T00:00:00",
business_zip: 14650,
ttxid: "0000024-02-999",
full_business_address: "348 GILMORE ST",
dba_start_date: "2003-01-01T00:00:00",
dba_name: "EASTMAN KODAK CO",
certificate_number: 0000024,
ownership_name: "EASTMAN KODAK CO",
mailing_address_1: "343 STATE STREET",
state: "NY",
mailing_city_state_zip_code: "ROCHESTER NY 14650-0904"
)

puts "Done."