# DISPLAY WELCOME MESSAGE
puts "--------------------"
puts "Welcome to Instacart"
puts "--------------------"
# CREATE A HASH FOR THE STORE
STORE = {
  kiwi: { price: 1.25, stock: 5 },
  banana: { price: 0.5, stock: 3 },
  mango: { price: 4, stock: 6 },
  asparagus: { price: 9, stock: 2 }
}
# DISPLAY THE STORE TO THE USER
puts "In our store today:"
STORE.each do |item, info|
  puts "#{item}: $#{info[:price]} - #{info[:stock]} available"
end
# ASK THE USER WHAT THEY WANT TO BUY
# cart = []
cart = {}
loop do
  puts "Which item? (or 'quit' to checkout)"
  item = gets.chomp.downcase.to_sym
  break if item == :quit
  puts "How many?"
  quantity = gets.chomp.to_i
  if STORE.include?(item) && quantity <= STORE[item][:stock]
    if cart.include?(item)
      cart[item] += quantity
    else
      cart[item] = quantity
    end
    STORE[item][:stock] -= quantity
  elsif STORE.include?(item) && quantity > STORE[item][:stock]
    puts "Sorry, there are only #{STORE[item][:stock]} #{item}s left..."
  else
    puts "Sorry, we don't have #{item} today."
  end
end
# SHOW THE CART TO THE USER
# puts "Please review your cart:"
# print cart
# CALCULATE THE CART'S TOTAL
# prices = cart.map do |item|
#   STORE[item.to_sym]
# end
prices = cart.keys.map do |item|
  STORE[item][:price] * cart[item]
end
# DISPLAY THE BILL TO USER
puts "-------BILL---------"
cart.each do |item, quantity|
  puts "#{quantity} #{item} x #{STORE[item][:price]} = $ #{quantity * STORE[item][:price]}"
end
puts "TOTAL: $ #{prices.sum}"
puts "--------------------"