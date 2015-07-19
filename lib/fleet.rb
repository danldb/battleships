require_relative './ship.rb'

class Fleet

  def initialize(ships:, player:, shipclass: Ship)
    self.player = player
    self.shipclass = shipclass
    build(ships)
  end

  def ships
    @ships ||= []
  end

  def register_sunk(sunk_ship)
    ships.reject! {|ship| ship == sunk_ship}
    player.report_destroyed if ships.empty?
  end

  private

  attr_accessor :player, :shipclass

  def build(ships_to_build)
    ships_to_build.each do |ship, quantity|
      quantity.times { ships << shipclass.new(type: ship, fleet: self) }
    end
  end


end
