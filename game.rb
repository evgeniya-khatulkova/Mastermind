class Ball

  attr_accessor :color, :place, :code

  def initialize(color, place)
    @color = color
    @place = place
  end

end

class Code

  def initialize()
    @source = false
    @balls = []
    @tries =+ 1

  end

  def add_ball(ball)
    @balls << ball
  end

end

ball_1 = Ball.new("black", 4)
new_code = Code.new
new_code.add_ball(ball_1)
p new_code
