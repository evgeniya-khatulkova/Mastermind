require_relative "player"
require_relative "game"

class Code

  attr_accessor :balls, :player

  def initialize()
    @balls = []
  end

include Game

  def make_it_source
    @source = true
    @tries = 0
  end

  def add_ball(ball)
    @balls << ball
  end

  def compare_code(sourse_code, code_breaker)
  # p sourse_code.balls
  puts "#{MAGENTA}                              #{ENDCOLOR}"
  balls = @balls.sort {|a, b| a.place<=>b.place}
  p balls
  code_breaker.add_to_history(balls)
  p code_breaker
  code_breaker.history.each do |code|
    puts code.each {|ball| print "|#{ball.place}-#{ball.color}|"}
  end
  balls.each {|ball| print "|#{ball.place}-#{ball.color}|"}
   hint = @balls.count do |ball|
      sourse_code.balls.any?{ |source_ball| source_ball.color == ball.color}
    end
    hint_absolute = @balls.count do |ball|
      sourse_code.balls.any?{ |source_ball| source_ball.color == ball.color && source_ball.place == ball.place}
    end
    puts
    p "There are #{hint} right color pings in your code"
    p "There are #{hint_absolute} pings with colors match on the right places"
    if hint_absolute == 4
      puts "Congratulations you won the game! You are a real code breaker))"
      end_game
    end
  end
end
