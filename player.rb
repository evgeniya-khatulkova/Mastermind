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

def dashboard
  @history.each do |code|
    puts "--------------------------------------------------"
    code.balls.each {|ball| print "#{MAGENTA}|#{ball.place}-#{ball.color}|#{ENDCOLOR}"}
    print "    "
    code.hints_color.times do
      print " #{YELLOW}*#{ENDCOLOR}"
    end
    code.hints_absolute.times do
      print " #{RED}*#{ENDCOLOR}"
    end
    puts
    puts "-------------------------------------------------"
  end
end
end
