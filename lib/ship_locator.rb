class ShipLocator

  def initialize
    self.occupied_coords = []
  end

  def generate_coords(ship:,orientation:,seed:)
    coords = add_coord([], seed)
    length = (ship.length - 1)
    length.times { coords = build_coords(coords, orientation)}
    record_occupied(coords)
  end

  private

  attr_accessor :occupied_coords

  def add_coord(ship_coords, new_coords)
    fail 'that is outside the playable area' if out_of_play?(new_coords)
    fail 'there is already a ship there' if occupied_coords.include? new_coords
    ship_coords << new_coords
  end

  def build_coords(coords, orientation)
    y = coords[-1][-1]
    x = coords[-1][0]
    (orientation == :vertical) ? add_coord(coords,[x,y + 1]) : add_coord(coords, [x + 1,y])
  end

  def record_occupied coords
    coords.each {|coord| occupied_coords << coord }
    coords
  end

  def out_of_play?(coords)
    coords.any? {|coord| coord > 9 || coord < 0 }
  end

end
