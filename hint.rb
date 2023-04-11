require_relative "game"
require_relative "code"

class Hint
  attr_accessor :color, :code

  def initialize(color)
    @color = color
  end

include Game

end
