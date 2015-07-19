require_relative './shot.rb'

class Player

  attr_writer :game

  def initialize(shootable:, shotclass: Shot)
    self.shootable = shootable
    self.shotclass = shotclass
    self.previous_coords = []
  end

  def shoot(coords)
    unless previous_coords.include?(coords)
      previous_coords << coords
      shootable.shoot(coords: coords, shot: new_shot(coords))
    end
  end

  def report_destroyed
    game.lose_game(self)
  end

  private

  attr_reader :game
  attr_accessor :shootable, :previous_coords, :shotclass

  def new_shot(coords)
    shotclass.new(coords: coords, player: self)
  end

end
