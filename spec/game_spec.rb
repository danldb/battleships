require 'game'

describe Game do
  let(:player_one){double :player, shoot: nil, :'game=' => nil}
  let(:player_two){double :player, shoot: nil, :'game=' => nil}

  subject do
    Game.new(player_one: player_one, player_two: player_two)
  end

  it 'starts with player one\'s turn' do
    expect(subject.turn).to eq player_one
  end

  it 'is player two\'s turn after player 1 makes a shot' do
    player_one_shot
    expect(subject.turn).to eq player_two
  end

  it 'is player one\'s turn after player 2 takes a shot' do
    player_one_shot
    player_two_shot
    expect(subject.turn).to eq player_one
  end

  it 'is not possible for a player to shoot if it is not their turn' do
    expect(player_two).not_to receive(:shoot)
    player_two_shot
  end

  it 'does not have a winner' do
    expect(subject.winner).to eq nil
  end

  it 'can be won' do
    subject.lose_game(player_one)
    expect(subject.winner).to eq player_two
  end

  it 'will not make a shot when the game has been won' do
    subject.lose_game(player_one)
    expect(player_one).not_to receive(:shoot)
    player_one_shot
  end

  def player_one_shot
    subject.make_a_shot(player: player_one, coord: :coord)
  end

  def player_two_shot
    subject.make_a_shot(player: player_two, coord: :coord)
  end

end
