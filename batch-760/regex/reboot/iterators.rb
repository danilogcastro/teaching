batch_760 = ["zippy", "marc", "valeria", "jeff", "pablo", "shater", "pedro"]

puts batch_760[2]

batch_760[4] = "gabriel"
p batch_760

batch_760.delete("pedro")
batch_760.delete_at(-1)

# batch_760.each do |name|
#   puts name.capitalize
# end

# new_array = batch_760.map do |name|
#   name.upcase
# end

# students_with_p = batch_760.select do |name|
#   name.start_with?("p")
# end

# p students_with_p

# students_without_p = batch_760.reject do |name|
#   name.start_with?("p")
# end

# p students_without_p

