require 'http'

puts "\nTest index (all products):"
puts response = HTTP.get('http://localhost:3000/api/products')

puts "\nTest show (product id 2):"
puts response = HTTP.get('http://localhost:3000/api/products/2')

# puts "\nTest create:"
# puts "Please enter product name:"
# name = gets.chomp
# puts "Please enter product price:"
# price = gets.chomp.to_i
# puts "Please enter image URL:"
# image_url = gets.chomp
# puts "Please enter description:"
# description = gets.chomp
# puts response = HTTP.post('http://localhost:3000/api/products/',
#   :form => {
#     :name => name,
#     :price => price,
#     :image_url => image_url,
#     :description => description})

puts "\nTest update:"
puts "Please enter ID of product to update:"
id = gets.chomp
puts "Please enter the new price:"
price = gets.chomp.to_i
puts response = HTTP.patch('http://localhost:3000/api/products/' + id, :form => {
  :price => price
})

# puts "\nTest destroy:"
# puts "ID of product to delete?"
# id = gets.chomp
# puts response = HTTP.delete('http://localhost:3000/api/products/' + id)