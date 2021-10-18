def calculator(num1, num2, operation)
  # if operation == "+"
  #   result = num1 + num2
  # elsif operation == "-"
  #   result = num1 - num2
  # elsif operation == "*"
  #   result = num1 * num2
  # elsif operation == "/"
  #   if num2 == 0
  #     puts "There is no division by 0. Try again."
  #   else
  #     result = num1 / num2
  #   end
  # else
  #   puts "Please choose a valid option."
  # end

  case operation
  when "+" then num1 + num2
  when "-"then num1 - num2
  when "*" then num1 * num2
  when "/"
    if num2 == 0
      puts "There is no division by 0. Try again."
    else
      num1 / num2
    end
  else
    puts "Please choose a valid option."
  end
end