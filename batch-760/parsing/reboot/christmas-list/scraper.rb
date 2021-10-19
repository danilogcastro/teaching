require 'nokogiri'

filepath = '/Users/danilocastro/code/danilogcastro/teaching/batch-760/parsing/reboot/christmas-list/results.html'

html_content = File.open(filepath)
doc = Nokogiri::HTML(html_content)

doc.search('.v2-listing-card__info h3').take(5).each do |element|
  p element.text.strip
end

doc.search('.currency-value').take(5).each do |element|
  puts element.text
end