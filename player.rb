require_relative "game"

class Player
  attr_accessor :history, :code

  def initialize(name)
    @name = name
    @history = []
  end
include Game

def add_to_history(code)
  @history << code
end

end
