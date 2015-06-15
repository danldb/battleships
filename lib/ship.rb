class Ship

  attr_reader :coords, :length

  def initialize(length: 1)
    self.sunk = false
    self.coords = []
    self.length = length
  end

  def hit
    self.sunk = true
  end

  def sunk?
    sunk
  end

  def assign_position(coordinates)
    fail 'off the board' if coordinates.any? {|coord| coord > 9 }
    coords << coordinates
  end

  private

  attr_accessor :sunk
  attr_writer :coords, :length

end
