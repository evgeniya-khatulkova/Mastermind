RED="\e[31m"
ENDCOLOR="\e[0m"


# require_relative "code"
# require_relative "ball"


module Game
def self.start_game
  puts "  Let's play #{RED}Mastermind#{ENDCOLOR}. Mastermind is a code-breaking game played by two players using a board with colored pegs. One player creates a secret code, and the other player tries to guess it using feedback provided about their guesses.
  Code will consist of 4 pegs and the code-breaker has 12 tries to find out the right combination."
  puts "Please, enter the name of the code-breaker"
  name = gets.chomp
  puts
  puts"Welcom, dear #{name}. Let the game begin"
  code_breaker = Player.new(name)

end

def self.set_sourse_code
  sourse_code = Code.new
  Ball.random_balls(sourse_code)
  # sourse_code.tries_count
  self.take_a_try(sourse_code)
end

def self.choose_color(colors)
  puts
  puts "Choose a color:"
  puts colors
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
  puts positions
  chosen_position = gets.chomp.to_i
  until positions.include?(chosen_position)
    puts "Choose from the available positions"
    chosen_position = gets.chomp.to_i
  end
  chosen_position
end

def self.take_a_try(sourse_code)
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
    p code
    code.compare_code(sourse_code)
    i += 1
  end

end

end
