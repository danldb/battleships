class Game

  attr_reader :turn, :winner

  def initialize(player_one:,player_two:)
    self.players = [player_one, player_two]
    self.turn = player_one
  end

  def make_a_shot(player:, coord:)
    if playable?(player)
      player.shoot(coord)
      next_turn(player)
    end
  end

  def lose_game(player)
    self.winner = players.reject do |losing_player|
      losing_player == player
    end.first
  end

  private

  def next_turn(current_player)
    self.turn = players.reject { |player| player == current_player }.first
  end

  def playable?(player)
    turn == player && !winner
  end

  attr_writer :turn, :winner
  attr_accessor :players

end
