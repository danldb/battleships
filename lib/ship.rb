class Ship

  attr_reader :length, :lives, :type

  def initialize(type:, fleet:)
    self.length = SHIP_SIZES[type]
    self.lives = length
    self.type = type
    self.fleet = fleet
  end

  def hit(shot)
    self.lives = lives - 1
    shot.register_hit
    register_kill(shot) if sunk?
  end

  private

  attr_writer :length, :lives, :type
  attr_accessor :fleet

  SHIP_SIZES = {aircraft_carrier: 5,
                battleship: 4,
                submarine: 3,
                destroyer: 3,
                patrol_boat: 2}

  def sunk?
    lives <= 0
  end

  def register_kill(shot)
    shot.register_kill(self)
    fleet.register_sunk(self)
  end

end
