class Player
  attr_reader :name

  def initialize(name)
    @name = name
  end

  include Game
end
