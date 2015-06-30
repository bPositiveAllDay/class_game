class Player 

  attr_accessor :name, :points, :lives

  def initialize(name, lives = 3, points = 0)
    @name = name
    @lives = lives
    @points = points
  end

end
