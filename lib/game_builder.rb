class GameBuilder

  def initialize(player_one:,player_two:,fleetclass: Fleet, boardclass: Board)
    self.players = [player_one, player_two]
    self.fleetclass = fleetclass
    self.boardclass = boardclass
  end

  def generate_boards
    players.each {|player| player.board = boardclass.new}
  end

  def generate_fleets
    self.fleets = [fleetclass.new(players[0]),
                   fleetclass.new(players[1])]
  end

  private

  attr_accessor :players, :fleets, :fleetclass, :boardclass

end
