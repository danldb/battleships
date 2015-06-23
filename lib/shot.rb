class Shot

  def initialize(coord:, player:)
    self.coord = coord
    self.player = player
  end

  def register_hit
    self.hit = true
    player.register_hit(coord)
  end

  def register_miss
    self.hit = false
    player.register_miss(coord)
  end

  def register_kill(ship)
    player.register_kill(ship)
  end

  private

  attr_accessor :coord, :hit, :player

end
