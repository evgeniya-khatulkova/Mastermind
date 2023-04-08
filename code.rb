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
