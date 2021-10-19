require_relative 'christmas_list'

puts "Welcome to the Christmas List"

GIFT_LIST = load_csv

loop do
  puts "Which action [list|add|mark|delete|idea|quit]?"
  action = gets.chomp.downcase
  break if action == 'quit'
  case action
  when 'list'
    list(GIFT_LIST)
  when 'add'
    puts "What is the name?"
    name = gets.chomp.downcase
    puts "What is the price?"
    price = gets.chomp.to_f
    gift = { name: name, price: price, bought: false }
    GIFT_LIST << gift
    save_csv(GIFT_LIST)
  when 'delete'
    list(GIFT_LIST)
    puts "Which item would you like to delete?"
    item_index = gets.chomp.to_i - 1
    GIFT_LIST.delete_at(item_index)
    save_csv(GIFT_LIST)
  when 'mark'
    list(GIFT_LIST)
    puts "Which item would you like to toggle?"
    item_index = gets.chomp.to_i - 1
    GIFT_LIST[item_index][:bought] = !GIFT_LIST[item_index][:bought]
    save_csv(GIFT_LIST)
  when 'idea'
    puts "What do you want to look for?"
    idea = gets.chomp.downcase
    items = scrape(idea)
    items.each_with_index do |item, index|
      puts "#{index + 1} - #{item[:name]} - $ #{item[:price]}"
    end
    puts "Which item do you want to add to your list?"
    index = gets.chomp.to_i - 1
    gift = { name: items[index][:name], price: items[index][:price], bought: false }
    GIFT_LIST << gift
    save_csv(GIFT_LIST)
  end
end