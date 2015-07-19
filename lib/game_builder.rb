class GameBuilder

  SHIPS = {aircraft_carrier: 1,
          battleship: 1,
          submarine: 1,
          destroyer: 1,
          patrol_boat: 1}

  def initialize(player_one:,player_two:)
    self.players = [player_one, player_two]
  end

  def add_boards_to_players
    players.each {|player| player.board = Board.new}
  end

  def add_players_to_fleets
    self.fleets = [Fleet.new(ships: SHIPS, player: players[0]), Fleet.new(ships: SHIPS, player: players[1])]
  end

  private

  attr_accessor :players, :fleets

end
