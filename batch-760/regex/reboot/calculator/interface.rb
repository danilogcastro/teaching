require_relative 'calculator'

puts "Welcome to the calculator!"

running = true

while running
# ASK USER FOR ONE NUMBER
  puts "Type one number:"
  print "> "
  num1 = gets.chomp.to_f
  # ASK USER FOR ANOTHER NUMBER
  puts "Type another number:"
  print "> "
  num2 = gets.chomp.to_f
  # ASK USER FOR OPERATION
  puts "What operation? [+][-][*][/]"
  print "> "
  operation = gets.chomp
  # PERFORM CALCULATION
  
  result = calculator(num1, num2, operation)

  # PRINT THE RESULT
  puts "Result: #{result}"

  puts "Do you want to calculate again? [Y/n]"
  answer = gets.chomp.downcase
  running = false if answer == "n"
end