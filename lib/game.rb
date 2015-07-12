class Game

  attr_reader :player_one, :player_two, :turn

  def initialize(player_one:,player_two:)
    self.player_one = player_one
    self.player_two = player_two
    self.turn = player_one
  end

  def make_a_shot(player:, coord:)
    if turn == player
      player.shoot(coord)
      next_turn(player)
    end
  end

  private

  def next_turn(current_player)
    players = [player_one, player_two]
    self.turn = players.reject { |player| player == current_player }.first
  end

  attr_writer :player_one, :player_two, :turn

end
