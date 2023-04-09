class Code

  attr_reader :balls, :tries

  def initialize()
    @source = false
    @tries =+ 1
    @balls = []
  end

  def make_it_source
    @source = true
    @tries = 0
  end

  def add_ball(ball)
    @balls << ball
  end

  def tries_count
    @tries
    puts "You have #{13 - @tries} tries left"
    @tries
  end

  def compare_code(sourse_code)
  p sourse_code.balls
   hint = @balls.count do |ball|
      sourse_code.balls.any?{ |source_ball| source_ball.color == ball.color}
    end
    hint_absolute = @balls.count do |ball|
      sourse_code.balls.any?{ |source_ball| source_ball.color == ball.color && source_ball.place == ball.place}
    end
    p "There are #{hint} right color pings in your code"
    p "There are #{hint_absolute} pings with colors match on the right places"
  end

end
