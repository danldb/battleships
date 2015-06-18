class Player

  def initialize(shootable)
    @shootable = shootable
  end

  def shoot(coords)
    shootable.shoot(coords)
  end

  private

  attr_reader :shootable


end
