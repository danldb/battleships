class Ship

  attr_reader :length, :lives

  def initialize(length: 2)
    self.length = length
    self.lives = length
  end

  def hit(shot)
    self.lives = lives - 1
    shot.register_hit
    shot.register_kill if sunk?
  end


  private

  attr_writer :length, :lives

  def sunk?
    lives <= 0
  end


end
