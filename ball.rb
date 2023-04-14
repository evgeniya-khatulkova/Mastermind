require_relative "game"
require_relative "code"

class Ball
  attr_accessor :color, :place, :code

  def initialize(color, place)
    @color = color
    @place = place
  end
include Game

  def self.random_balls(code)
    colors = ["red", "yellow", "blue", "green", "white", "black", "brown", "orange"]
    positions = [1, 2, 3, 4]
    4.times do
      position_random = positions.sample
      color_random = colors.sample
      colors.delete(color_random)
      positions.delete(position_random)
      code.add_ball(Ball.new(color_random, position_random))
    end
  end
end
