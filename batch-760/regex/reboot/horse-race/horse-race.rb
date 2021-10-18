# PRINT A WELCOME MESSAGE
puts "Welcome to the horse race!"
# PRINT A LIST OF HORSES AND ASK FOR A CHOICE
HORSES = ["Gypsy", "Ladybug", "Cisco", "Sugar", "Trooper", "Buddy"]
balance = 100

# running = true

until balance == 0
  puts "What horse do you choose?"
  puts HORSES
  user_choice = gets.chomp.downcase
  # COMPUTER SAMPLES THE WINNING HORSE
  winner = HORSES.sample
  # COMPARE USER CHOICE WITH WINNER
  # DISPLAY MESSAGE TO USER WHETHER OR NOT THEY WON
  puts "The winner was #{winner}"
  if user_choice == winner.downcase
    puts "Congratulations! You won."
    balance += 50
  else
    puts "Too bad! Better luck next time."
    balance -= 10
  end
  puts "Your new balance is #{balance}"
  # if balance <= 0
  #   puts "Sorry, you don't have any money left!"
  #   break
  # end
  unless balance <= 0
    puts "Do you want to play again? [Y/n]"
    answer = gets.chomp.downcase
    break if answer == "n"
  end
end