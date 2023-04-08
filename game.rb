require_relative "code"
require_relative "ball"
require_relative "player"

module Game
def self.start_game
  puts "  Let's play Mastermind. Mastermind is a code-breaking game played by two players using a board with colored pegs. One player creates a secret code, and the other player tries to guess it using feedback provided about their guesses.
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
  p sourse_code
end


ball_1 = Ball.new("black", 4)
ball_2 = Ball.new("white",2)
ball_3 = Ball.new("yellow",3)
ball_4 = Ball.new("red",1)
new_code = Code.new
new_code.add_ball(ball_1)
new_code.add_ball(ball_2)
new_code.add_ball(ball_3)
new_code.add_ball(ball_4)
new_code.make_it_source
po = new_code.balls
po.each {|ball| p ball.color }
end
