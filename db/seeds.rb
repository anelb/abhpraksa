# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(first_name: 'Fidel', last_name: 'Castro', email: 'admin@admin.com', password: 'admin', password_confirmation: 'admin', role: 'admin')
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


zenska_obuca   = Category.create!(title: 'ZENSKA OBUCA')
muska_obuca    = Category.create!(title: 'MUSKA OBUCA')
djecija_obuca  = Category.create!(title: 'DJECIJA OBUCA')
sportska_obuca = Category.create!(title: 'SPORTSKA OBUCA')
dodaci         = Category.create!(title: 'DODACI')

product_1 = Product.create!(title: 'Chuck Taylor All Star II product_1', brand_id: 1, price: 70, style: 'casual', 
              description: 'The Converse Chuck Taylor All Star II retains the iconic Chuck Taylor All Star silhouette you know and love, 
              but is built for more to better meet the demands of your “on the go” lifestyle',
              photo_url: 'https://s3.eu-central-1.amazonaws.com/imagesrandom/home.png')
product_2 = Product.create!(title: 'Chuck Taylor All Star II product_2', brand_id: 1, price: 70, style: 'casual', 
              description: 'The Converse Chuck Taylor All Star II retains the iconic Chuck Taylor All Star silhouette you know and love, 
              but is built for more to better meet the demands of your “on the go” lifestyle',
              photo_url: 'https://s3.eu-central-1.amazonaws.com/imagesrandom/home.png')
product_3 = Product.create!(title: 'Chuck Taylor All Star II product_3', brand_id: 1, price: 70, style: 'casual', 
              description: 'The Converse Chuck Taylor All Star II retains the iconic Chuck Taylor All Star silhouette you know and love, 
              but is built for more to better meet the demands of your “on the go” lifestyle',
              photo_url: 'https://s3.eu-central-1.amazonaws.com/imagesrandom/home.png')
product_4 = Product.create!(title: 'Chuck Taylor All Star II product_4', brand_id: 1, price: 70, style: 'casual', 
              description: 'The Converse Chuck Taylor All Star II retains the iconic Chuck Taylor All Star silhouette you know and love, 
              but is built for more to better meet the demands of your “on the go” lifestyle',
              photo_url: 'https://s3.eu-central-1.amazonaws.com/imagesrandom/home.png')

product_5 = Product.create!(title: 'Chuck Taylor All Star II product_1', brand_id: 1, price: 70, style: 'casual', 
              description: 'The Converse Chuck Taylor All Star II retains the iconic Chuck Taylor All Star silhouette you know and love, 
              but is built for more to better meet the demands of your “on the go” lifestyle',
              photo_url: 'https://s3.eu-central-1.amazonaws.com/imagesrandom/home.png')
product_6 = Product.create!(title: 'Chuck Taylor All Star II product_2', brand_id: 1, price: 70, style: 'casual', 
              description: 'The Converse Chuck Taylor All Star II retains the iconic Chuck Taylor All Star silhouette you know and love, 
              but is built for more to better meet the demands of your “on the go” lifestyle',
              photo_url: 'https://s3.eu-central-1.amazonaws.com/imagesrandom/home.png')
product_7 = Product.create!(title: 'Chuck Taylor All Star II product_3', brand_id: 1, price: 70, style: 'casual', 
              description: 'The Converse Chuck Taylor All Star II retains the iconic Chuck Taylor All Star silhouette you know and love, 
              but is built for more to better meet the demands of your “on the go” lifestyle',
              photo_url: 'https://s3.eu-central-1.amazonaws.com/imagesrandom/home.png')
product_8 = Product.create!(title: 'Chuck Taylor All Star II product_4', brand_id: 1, price: 70, style: 'casual', 
              description: 'The Converse Chuck Taylor All Star II retains the iconic Chuck Taylor All Star silhouette you know and love, 
              but is built for more to better meet the demands of your “on the go” lifestyle',
              photo_url: 'https://s3.eu-central-1.amazonaws.com/imagesrandom/home.png')

green  = Color.create!(product_color: 'Green')
black  = Color.create!(product_color: 'Black')
red    = Color.create!(product_color: 'Red')
yellow = Color.create!(product_color: 'yellow')

size_35 = Size.create!(product_size: '35')
size_36 = Size.create!(product_size: '36')
size_37 = Size.create!(product_size: '37')
size_38 = Size.create!(product_size: '38')
size_39 = Size.create!(product_size: '39')

product_1.product_variants.create(size_id: green.id, color_id: size_38.id)
product_1.product_variants.create(size_id: red.id,   color_id: size_39.id)
product_1.product_variants.create(size_id: black.id, color_id: size_35.id)

# create_table "product_variants", force: :cascade do |t|
# t.integer  "product_id"
# t.integer  "size_id"
# t.integer  "color_id"
# t.datetime "created_at", null: false
# t.datetime "updated_at", null: false
# end

zenska_obuca.products   << product_1
zenska_obuca.products   << product_2

muska_obuca.products    << product_3
muska_obuca.products    << product_4

sportska_obuca.products << product_1
sportska_obuca.products << product_2

# Product.create(title: 'Chuck Taylor All Star II', brand_id: 1, price: 70, style: 'casual', 
#               description: 'The Converse Chuck Taylor All Star II retains the iconic Chuck Taylor All Star silhouette you know and love, 
#               but is built for more to better meet the demands of your “on the go” lifestyle',
#               photo_url: 'https://s3.eu-central-1.amazonaws.com/imagesrandom/home.png')
# Product.create(title: 'Chuck Taylor All Star II', brand_id: 1, price: 75, style: 'casual', 
#               description: 'The Converse Chuck Taylor All Star II retains the iconic Chuck Taylor All Star silhouette you know and love, 
#               but is built for more to better meet the demands of your “on the go” lifestyle',
#               photo_url: 'https://s3.eu-central-1.amazonaws.com/imagesrandom/151161C_standard_small.jpg')
# Product.create(title: 'Chuck Taylor All Star II', brand_id: 1, price: 75, style: 'casual', 
#               description: 'The Converse Chuck Taylor All Star II retains the iconic Chuck Taylor All Star silhouette you know and love, 
#               but is built for more to better meet the demands of your “on the go” lifestyle',
#               photo_url: 'https://s3.eu-central-1.amazonaws.com/imagesrandom/150146C_standard_small.png')

# Product.create(title: 'Chuck Taylor All Star II InfTdlr', brand_id: 1, price: 75, style: 'casual', 
#               description: 'The Converse Chuck Taylor All Star II retains the iconic Chuck Taylor All Star silhouette you know and love, 
#               but is built for more to better meet the demands of your “on the go” lifestyle',
#               photo_url: 'https://s3.eu-central-1.amazonaws.com/imagesrandom/750143C_shot1_small.jpg')



# Product.create(title: 'Chuck TaylorAll Star II Yth/Jr', brand_id: 1, price: 50, style: 'casual', 
#               description: 'The Converse Chuck Taylor All Star II retains the iconic Chuck Taylor All Star silhouette you know and love, 
#               but is built for more to better meet the demands of your “on the go” lifestyle',
#               photo_url: 'https://s3.eu-central-1.amazonaws.com/imagesrandom/350148C_standard.jpg')

# Product.create(title: 'Chuck TaylorAll Star II Knit', brand_id: 1, price: 80, style: 'casual', 
#               description: 'The Converse Chuck Taylor All Star II retains the iconic Chuck Taylor All Star silhouette you know and love, 
#               but is built for more to better meet the demands of your “on the go” lifestyle',
#               photo_url: 'https://s3.eu-central-1.amazonaws.com/imagesrandom/grey_.jpg')

# Product.create(title: 'Chuck Taylor All Star II InfTdlr', brand_id: 1, price: 75, style: 'casual', 
#               description: 'The Converse Chuck Taylor All Star II retains the iconic Chuck Taylor All Star silhouette you know and love, 
#               but is built for more to better meet the demands of your “on the go” lifestyle',
#               photo_url: 'https://s3.eu-central-1.amazonaws.com/imagesrandom/750143C_shot1_small.jpg')

# Product.create(title: 'Chuck Taylor All Star II InfTdlr', brand_id: 1, price: 75, style: 'casual', 
#               description: 'The Converse Chuck Taylor All Star II retains the iconic Chuck Taylor All Star silhouette you know and love, 
#               but is built for more to better meet the demands of your “on the go” lifestyle',
#               photo_url: 'https://s3.eu-central-1.amazonaws.com/imagesrandom/750143C_shot1_small.jpg')
