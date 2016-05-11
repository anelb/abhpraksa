# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(first_name: 'Fidel', last_name: 'Castro', email: 'admin@admin.com', password: 'abc', password_confirmation: 'abc', role: 'admin')
User.create(first_name: 'Rae', last_name: 'Mcmeen', email: 'rae@abc.com', password: 'abc', password_confirmation: 'abc')
User.create(first_name: 'Melvina', last_name: 'Banister', email: 'mel@abc.com', password: 'abc', password_confirmation: 'abc')
User.create(first_name: 'Carletta', last_name: 'Vanwart', email: 'cha@abc.com', password: 'abc', password_confirmation: 'abc')
User.create(first_name: 'Sherrie', last_name: 'Harr', email: 'har@abc.com', password: 'abc', password_confirmation: 'abc')
User.create(first_name: 'Angelia', last_name: 'Asbill', email: 'asb@abc.com', password: 'abc', password_confirmation: 'abc')
User.create(first_name: 'Mina', last_name: 'Syed', email: 'syd@abc.com', password: 'abc', password_confirmation: 'abc')
User.create(first_name: 'Ardath', last_name: 'Wendler', email: 'wend@abc.com', password: 'abc', password_confirmation: 'abc')
User.create(first_name: 'Beckie', last_name: 'Goff', email: 'gof@abc.com', password: 'abc', password_confirmation: 'abc')

Brand.create(title: 'Converse')
Brand.create(title: 'Nike')
Brand.create(title: 'Adidas')

Product.create(title: 'Chuck Taylor All Star II', brand_id: 1, price: 70, style: 'casual', 
              description: 'The Converse Chuck Taylor All Star II retains the iconic Chuck Taylor All Star silhouette you know and love, 
              but is built for more to better meet the demands of your “on the go” lifestyle',
              photo_url: 'https://s3.eu-central-1.amazonaws.com/imagesrandom/home.png')
Product.create(title: 'Chuck Taylor All Star II', brand_id: 1, price: 75, style: 'casual', 
              description: 'The Converse Chuck Taylor All Star II retains the iconic Chuck Taylor All Star silhouette you know and love, 
              but is built for more to better meet the demands of your “on the go” lifestyle',
              photo_url: 'https://s3.eu-central-1.amazonaws.com/imagesrandom/151161C_standard_small.jpg')
Product.create(title: 'Chuck Taylor All Star II', brand_id: 1, price: 75, style: 'casual', 
              description: 'The Converse Chuck Taylor All Star II retains the iconic Chuck Taylor All Star silhouette you know and love, 
              but is built for more to better meet the demands of your “on the go” lifestyle',
              photo_url: 'https://s3.eu-central-1.amazonaws.com/imagesrandom/150146C_standard_small.png')

Product.create(title: 'Chuck Taylor All Star II InfTdlr', brand_id: 1, price: 75, style: 'casual', 
              description: 'The Converse Chuck Taylor All Star II retains the iconic Chuck Taylor All Star silhouette you know and love, 
              but is built for more to better meet the demands of your “on the go” lifestyle',
              photo_url: 'https://s3.eu-central-1.amazonaws.com/imagesrandom/750143C_shot1_small.jpg')

# create_table "products", force: :cascade do |t|
#   t.integer  "brand_id"
#   t.string   "title"
#   t.integer  "price"
#   t.string   "style"
#   t.datetime "created_at",  null: false
#   t.datetime "updated_at",  null: false
#   t.text     "description"
#   t.text     "photo_url"
# end