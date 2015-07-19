class Ship

  attr_reader :length, :lives, :type

  def initialize(type:)
    self.length = SHIP_SIZES[type]
    self.lives = length
    self.type = type
  end

  def hit(shot)
    self.lives = lives - 1
    shot.register_hit
    shot.register_kill(self) if sunk?
  end

  private

  attr_writer :length, :lives, :type

  SHIP_SIZES = {aircraft_carrier: 5,
                battleship: 4,
                submarine: 3,
                destroyer: 3,
                patrol_boat: 2}

  def sunk?
    lives <= 0
  end


end
