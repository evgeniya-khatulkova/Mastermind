RED="\e[31m"
ENDCOLOR="\e[0m"


require_relative "code"
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
  sourse_code.tries_count
  self.take_a_try(sourse_code)
end

def self.take_a_try(sourse_code)
  code = Code.new
  colors = ["red", "yellow", "blue", "green", "white", "black", "brown", "orange"]
  positions = [1, 2, 3, 4]
    4.times do
      puts "Choose a color:"
      puts colors
      chosen_color = gets.chomp
      puts "Choose a position:"
      puts positions
      chosen_position = gets.chomp.to_i
      colors.delete(chosen_color)
      positions.delete(chosen_position)
      code.add_ball(Ball.new(chosen_color, chosen_position))
    end
    p code
    code.compare_code(sourse_code)
end
end
