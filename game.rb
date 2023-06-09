RED="\e[31m"
YELLOW="\e[33m"
MAGENTA="\e[42m"
ENDCOLOR="\e[0m"


module Game

def self.start_game
  puts "  Let's play #{RED}Mastermind#{ENDCOLOR}. Mastermind is a code-breaking game played by two players using a board with colored pegs. One player creates a secret code, and the other player tries to guess it using feedback provided about their guesses.
  Code will consist of 4 pegs and the code-breaker has 12 tries to find out the right combination."
  set_sourse_code
end

def self.set_sourse_code
  puts "Do you want to be code-maker or code-breaker? Choose 1(code-maker) or 2(code-breaker)"
  role = gets.chomp
  until role == "1" || role == "2"
    puts "press 1 for code-maker or 2 for code-breaker"
    role = gets.chomp
  end
  if role == "2"
  sourse_code = Code.new
  Ball.random_balls(sourse_code)
  self.take_a_try(sourse_code)
  elsif role == "1"
    puts "BOOM"
    make_code
  end
end

def self.make_code
  computer_code = Code.new
  puts "You will choose 4 numbers for this game and computer will try to crack the code in 8 tries"
  4.times do
    puts "Give a number in range from 1 to 6"
    number = gets.chomp.to_i
    until (1..6).include?(number)
      puts "Give a number in range from 1 to 6"
      number = gets.chomp.to_i
    end
    computer_code.add_ball(number)
  end
  computer_code.crack_number_code
end

def self.choose_color(colors)
  puts
  puts "Choose a color:"
  colors.each {|color| print " #{color} "}
  puts
  chosen_color = gets.chomp
  until colors.include?(chosen_color)
    puts "Choose from the availbale colors"
    chosen_color = gets.chomp
  end
  chosen_color
end

def self.choose_position(positions)
  puts
  puts "Choose a position:"
  positions.each {|position| print " #{position}"}
  puts
  chosen_position = gets.chomp.to_i
  until positions.include?(chosen_position)
    puts "Choose from the available positions"
    chosen_position = gets.chomp.to_i
  end
  chosen_position
end

def self.take_a_try(sourse_code)
  puts "Please, enter the name of the code-breaker"
  name = gets.chomp
  puts
  puts"Welcom, dear #{RED}#{name}#{ENDCOLOR}. Let the game begin"
  code_breaker = Player.new(name)
  code = Code.new
  i = 0
  while i < 13
    puts "You have #{12 - i} tries"
    code = Code.new
    colors = ["red", "yellow", "blue", "green", "white", "black", "brown", "orange"]
    positions = [1, 2, 3, 4]
      4.times do
        chosen_color = self.choose_color(colors)
        chosen_position = self.choose_position(positions)
        colors.delete(chosen_color)
        positions.delete(chosen_position)
        code.add_ball(Ball.new(chosen_color, chosen_position))
      end
    code.compare_code(sourse_code, code_breaker)
    i += 1
  end
  puts "Oops, seems like you lost. Do you want to try to break the code again?"
  end_game
end

def self.choose_process(code)
colors = ["red", "yellow", "blue", "green", "white", "black", "brown", "orange"]
positions = [1, 2, 3, 4]
  4.times do
    chosen_color = self.choose_color(colors)
    chosen_position = self.choose_position(positions)
    colors.delete(chosen_color)
    positions.delete(chosen_position)
    code.add_ball(Ball.new(chosen_color, chosen_position))
  end
end

def end_game
  puts "Do you want to play again? Y/n"
  answer = gets.chomp
  until answer.downcase == "y" || answer.downcase == "n"
    "y - for yes, n - for no "
    answer = gets.chomp
  end
  if answer == "y"
    Game.start_game
  elsif answer == "n"
    exit
  end
end
end
