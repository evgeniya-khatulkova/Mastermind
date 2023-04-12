require_relative "player"
require_relative "game"

class Code

  attr_accessor :balls, :player, :hints_color, :hints_absolute

  def initialize()
    @balls = []
    @hints_color = 0
    @hints_absolute = 0
  end

include Game

  def add_ball(ball)
    @balls << ball
  end

  def add_hint_color(hint)
    @hints_color += hint
  end

  def add_hint_absolute(hint)
    @hints_absolute += hint
  end

  def compare_code(sourse_code, code_breaker)
  @balls = @balls.sort {|a, b| a.place<=>b.place}
  code_breaker.add_to_history(self)

  # balls.each {|ball| print "|#{ball.place}-#{ball.color}|"}
   hint = @balls.count do |ball|
      sourse_code.balls.any?{ |source_ball| source_ball.color == ball.color}
    end
    hint_absolute = @balls.count do |ball|
      sourse_code.balls.any?{ |source_ball| source_ball.color == ball.color && source_ball.place == ball.place}
    end

    self.add_hint_color(hint)
    self.add_hint_absolute(hint_absolute)


  code_breaker.history.each do |code|
    puts "--------------------------------------------------"
    code.balls.each {|ball| print "#{MAGENTA}|#{ball.place}-#{ball.color}|#{ENDCOLOR}"}
    code.hints_absolute.times { print "#{RED}*#{ENDCOLOR}"}
    print "    "
    code.hints_color.times do
      print " #{YELLOW}*#{ENDCOLOR}"
    end
    code.hints_absolute.times do
      print " #{RED}*#{ENDCOLOR}"
    end
    puts
    puts "-------------------------------------------------"
  end

    # p code_breaker

    p "There are #{hint} right color pings in your code"
    p "There are #{hint_absolute} pings with colors match on the right places"
    if hint_absolute == 4
      puts "Congratulations you won the game! You are a real code breaker))"
      end_game
    end
  end
end
