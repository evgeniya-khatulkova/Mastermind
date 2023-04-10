require_relative "game"

class Player
  attr_accessor :history

  def initialize(name)
    @name = name
    @history = []
  end
include Game

def add_to_history(balls)
  @history << balls
end

end
