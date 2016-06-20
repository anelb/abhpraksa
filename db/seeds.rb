# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(username: 'El dictator', first_name: 'Fidel', last_name: 'Castro', email: 'admin@admin.com', password: 'adminadmin', password_confirmation: 'adminadmin', role: 'admin', activated: true)

Brand.create(title: 'Converse')
Brand.create(title: 'Nike')
Brand.create(title: 'Adidas')


zenska_obuca   = Category.create(title: 'ŽENSKA OBUĆA')
muska_obuca    = Category.create(title: 'MUŠKA OBUĆA')
djecija_obuca  = Category.create(title: 'DJEČIJA OBUĆA')
sportska_obuca = Category.create(title: 'SPORTSKA OBUĆA')
dodaci         = Category.create(title: 'DODACI')

product_1 = Product.new(title: 'CONS Sumner ', brand_id: 1, price: 70, style: 'casual', 
                        description: 'The Converse Chuck Taylor All Star II retains the iconic Chuck Taylor All Star silhouette you know and love, 
              but is built for more to better meet the demands of your “on the go” lifestyle',
                        photo_url: 'https://s3.eu-central-1.amazonaws.com/abhshopdemo/products/6.png')
product_2 = Product.new(title: 'CONS One Star Pro ', brand_id: 1, price: 120, style: 'casual', 
                        description: 'The Converse Chuck Taylor All Star II retains the iconic Chuck Taylor All Star silhouette you know and love, 
              but is built for more to better meet the demands of your “on the go” lifestyle',
                        photo_url: 'https://s3.eu-central-1.amazonaws.com/abhshopdemo/products/2.png')
product_3 = Product.new(title: 'Chuck Taylor All Star II', brand_id: 1, price: 30, style: 'casual', 
                        description: 'The Converse Chuck Taylor All Star II retains the iconic Chuck Taylor All Star silhouette you know and love, 
              but is built for more to better meet the demands of your “on the go” lifestyle',
                        photo_url: 'https://s3.eu-central-1.amazonaws.com/abhshopdemo/products/3.jpg')
product_4 = Product.new(title: 'Chuck Taylor All Star III', brand_id: 1, price: 80, style: 'casual', 
                        description: 'The Converse Chuck Taylor All Star II retains the iconic Chuck Taylor All Star silhouette you know and love, 
              but is built for more to better meet the demands of your “on the go” lifestyle',
                        photo_url: 'https://s3.eu-central-1.amazonaws.com/abhshopdemo/products/4.png')

product_5 = Product.new(title: 'CONS CTAS Pro I', brand_id: 1, price: 70, style: 'casual', 
                        description: 'The Converse Chuck Taylor All Star II retains the iconic Chuck Taylor All Star silhouette you know and love, 
              but is built for more to better meet the demands of your “on the go” lifestyle',
                        photo_url: 'https://s3.eu-central-1.amazonaws.com/abhshopdemo/products/5.png')
product_6 = Product.new(title: 'Chuck Taylor All Star IV', brand_id: 1, price: 65, style: 'casual', 
                        description: 'The Converse Chuck Taylor All Star II retains the iconic Chuck Taylor All Star silhouette you know and love, 
              but is built for more to better meet the demands of your “on the go” lifestyle',
                        photo_url: 'https://s3.eu-central-1.amazonaws.com/abhshopdemo/products/7_.jpg')
product_7 = Product.new(title: 'Jack Purcell Signature I', brand_id: 1, price: 20, style: 'casual', 
                        description: 'The Converse Chuck Taylor All Star II retains the iconic Chuck Taylor All Star silhouette you know and love, 
              but is built for more to better meet the demands of your “on the go” lifestyle',
                        photo_url: 'https://s3.eu-central-1.amazonaws.com/abhshopdemo/products/8.jpg')
product_8 = Product.new(title: 'Jack Purcell Signature II', brand_id: 1, price: 70, style: 'casual', 
                        description: 'The Converse Chuck Taylor All Star II retains the iconic Chuck Taylor All Star silhouette you know and love, 
              but is built for more to better meet the demands of your “on the go” lifestyle',
                        photo_url: 'https://s3.eu-central-1.amazonaws.com/abhshopdemo/products/1_.png')

green  = Color.create(product_color: 'Green', hex_value: '#008000')
black  = Color.create(product_color: 'Black', hex_value: '#000000')
red    = Color.create(product_color: 'Red', hex_value: '#ff0000')
yellow = Color.create(product_color: 'Yellow', hex_value: '#ffff00')
grey   = Color.create(product_color: 'Grey', hex_value: '#808080')

size_35 = Size.create(product_size: '35')
size_36 = Size.create(product_size: '36')
size_37 = Size.create(product_size: '37')
size_38 = Size.create(product_size: '38')
size_39 = Size.create(product_size: '39')

pro = [ product_1, product_2, product_3, product_4, product_5, product_6, product_7, product_8]
cat = [ zenska_obuca, muska_obuca, djecija_obuca, sportska_obuca, dodaci]

pro.each do |product|
  cat.each do |category|
    product.categories.push(category)
  end
  product.product_variants.build(size_id: size_35.id, color_id: green.id, quantity: 10)
  product.product_variants.build(size_id: size_35.id, color_id: black.id, quantity: 10)
  product.product_variants.build(size_id: size_36.id, color_id: green.id, quantity: 10)
  product.product_variants.build(size_id: size_36.id, color_id: black.id, quantity: 10)
  product.product_variants.build(size_id: size_36.id, color_id: grey.id, quantity: 10)
  product.save!
end