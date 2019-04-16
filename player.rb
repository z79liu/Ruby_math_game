class Player
  attr_reader:name
  LIVES = 3
  def initialize(name)
    @name = name
    @lives = LIVES  
  end

  def lose_health
    @lives -= 1
  end

  def alive?
    @lives > 0
  end

  def summary
    "#{@name} has #{@lives}/#{LIVES}  left"
  end

  
end