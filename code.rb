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

  def tries_count
    @tries
    puts "You have #{13 - @tries} tries left"
  end

  def compare_code(sourse_code)
    p sourse_code.balls
    p @balls == sourse_code.balls
  end

end
