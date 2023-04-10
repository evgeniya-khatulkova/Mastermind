class Code

  attr_reader :balls

  def initialize()
    @balls = []
  end

  def make_it_source
    @source = true
    @tries = 0
  end

  def add_ball(ball)
    @balls << ball
  end

  def compare_code(sourse_code)
  # p sourse_code.balls
  puts "#{MAGENTA}                              #{ENDCOLOR}"
  @balls = @balls.sort {|a, b| a.place<=>b.place}
  @balls.each {|ball| print "|#{ball.place}-#{ball.color}|"}
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
