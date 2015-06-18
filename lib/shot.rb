class Shot

  def initialize(coord:)
    self.coord = coord
  end

  def register_hit
    self.hit = true
  end

  def register_miss
    self.hit = false
  end

  def miss?
    not hit
  end

  def hit?
    hit
  end

  private

  attr_accessor :coord, :hit

end
