class Code

  attr_reader :balls

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

end

class Ball 

  attr_accessor :color, :place, :code

  def initialize(color, place)
    @color = color
    @place = place
  end

end



ball_1 = Ball.new("black", 4)
new_code = Code.new
new_code.add_ball(ball_1)
new_code.make_it_source
po = new_code.balls
p po.each {|ball| p ball.color }
