class ShipLocator

  def initialize
    self.coords = []
  end

  def generate_coords(ship:,orientation:,seed:)
    assign_position(seed)
    self.orientation = orientation
    self.length = (ship.length - 1)
    build_coords
  end

  private

  attr_accessor :length, :orientation, :coords

  def assign_position(coordinates)
    fail 'off the board' if coordinates.any? {|coord| coord > 9 }
    coords << coordinates
  end

  def build_coords
    length.times{add_coord}
    coords
  end

  def add_coord
    y = (coords[-1][-1] + 1)
    x = coords[-1][0]
    (orientation == :vertical) ? assign_position([x,y]) : assign_position([y,x])
  end


end
