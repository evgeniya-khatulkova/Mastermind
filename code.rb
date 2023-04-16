require_relative "player"
require_relative "game"

class Code

  attr_accessor :balls, :player, :hints_color, :hints_absolute

  def initialize()
    @balls = []
    @hints_color = 0
    @hints_absolute = 0
  end

include Game

  def add_ball(ball)
    @balls << ball
  end

  def add_hint_color(hint)
    @hints_color += hint
  end

  def add_hint_absolute(hint)
    @hints_absolute += hint
  end

  def failed_try(colors,try)
    if @hints_color == 0
      colors.delete(try[0])
      colors.delete(try[3])
    end
  end

  def crack_number_code
    computer = Player.new("computer")
      colors = [1, 2, 3, 4, 5, 6]
      try = [1, 1, 2, 2]
      hinting(computer, try)
      failed_try(colors,try)
      2.times do
        try.map!{|number| number + 2}
        hinting(computer, try)
        failed_try(colors,try)
      end
      i = 0
      while i < colors.length
      try.map!{|number| colors[i]}
      hinting(computer, try)
      if @hints_color == 0
        colors.delete(try[i])
      end
      i += 1
    end
      while computer.history.length < 12
        try.map!{|number| colors.sample}
        hinting(computer, try)
      end
    puts "Oops, it seems like computer failed to hack code. Good for you!! You won the game. Computer lost :(("
    end_game
  end

  def hinting(computer, try)
    if @balls == try
      puts "Computer cracked your code in #{computer.history.length} attempts"
      end_game
    end
    @hints_absolute = 0
    @hints_color = 0
    hint_color = try.uniq.count {|number| @balls.include?(number)}
    add_hint_color(hint_color)
    try.each_with_index{ |number, index| add_hint_absolute(1) if @balls[index] == number}
    computer.add_to_history(self)
    puts "#{MAGENTA}Try number #{computer.history.length}#{ENDCOLOR}"
    puts "################################################################"
    puts "Code: #{try}"
    puts "################################################################"
    puts "Numbers matches: #{@hints_color}"
    puts "On the right place: #{@hints_absolute}"
  end

  def compare_code(sourse_code, code_breaker)
    @balls = @balls.sort {|a, b| a.place<=>b.place}
    code_breaker.add_to_history(self)

   hint = @balls.count do |ball|
      sourse_code.balls.one?{ |source_ball| source_ball.color == ball.color}
    end
    hint_absolute = @balls.count do |ball|
      sourse_code.balls.one?{ |source_ball| source_ball.color == ball.color && source_ball.place == ball.place}
    end

    self.add_hint_color(hint)
    self.add_hint_absolute(hint_absolute)

    code_breaker.dashboard

    p "There are #{hint} right color pings in your code"
    p "There are #{hint_absolute} pings with colors match on the right places"
    if hint_absolute == 4
      puts "Congratulations you won the game! You are a real code breaker))"
      end_game
    end
  end
end
