class Player

  def initialize(shootable:, shotclass:)
    @shootable = shootable
    @shotclass = shotclass
    @previous_coords = []
  end

  def shoot(coords)
    unless previous_coords.include?(coords)
      previous_coords << coords
      shootable.shoot(coords, shot(coords))
    end
  end

  private

  attr_reader :shootable, :previous_coords, :shotclass

  def shot(coords)
    shotclass.new(coords: coords)
  end

end
