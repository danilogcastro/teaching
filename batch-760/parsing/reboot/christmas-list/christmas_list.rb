require 'csv'
require 'nokogiri'
require 'open-uri'

def list(array)
  array.each_with_index do |item, index|
    status = item[:bought] ? "X" : ""
    puts "#{index + 1} - [#{status}] #{item[:name]} - $ #{item[:price]}"
  end
end

def load_csv
  gift_list = []
  filepath = 'gifts.csv'
  csv_options = { col_sep: ',', quote_char: '"', headers: :first_row }
  CSV.foreach(filepath, csv_options) do |row|
    name = row['name']
    price = row['price'].to_f
    bought = row['bought'] == 'true'
    gift_list << { name: name, price: price, bought: bought }
  end
  gift_list
end

def save_csv(list)
  filepath = 'gifts.csv'
  csv_options = { col_sep: ',', force_quotes: true, quote_char: '"' }
  CSV.open(filepath, 'wb', csv_options) do |csv|
    csv << ['name', 'price', 'bought']
    list.each do |gift|
      csv << [gift[:name], gift[:price], gift[:bought]]
    end
  end
end

def scrape(item)
  etsy_names = []
  etsy_prices = []
  etsy_items = []
  url = "https://www.etsy.com/search?q=#{item}"
  html_content = URI.open(url).read
  doc = Nokogiri::HTML(html_content)

  doc.search('.v2-listing-card__info h3').take(5).each do |element|
    etsy_names << element.text.strip
  end
  
  doc.search('.currency-value').take(5).each do |element|
    etsy_prices << element.text
  end
  
  etsy_names.each_with_index do |name, index|
    etsy_items << { name: name, price: etsy_prices[index] }
  end
  etsy_items
end