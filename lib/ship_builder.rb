require 'ship'

class ShipBuilder

  SHIP_SIZES = {aircraft_carrier: 5,
                battleship: 4,
                submarine: 3,
                destroyer: 3,
                patrol_boat: 2}

  def self.method_missing(ship)
    is_valid?(ship) ? build(ship) : super
  end

  private

  def self.build(ship)
    Ship.new(length: SHIP_SIZES[ship])
  end

  def self.is_valid?(ship)
    SHIP_SIZES.keys.include?(ship)
  end

end
