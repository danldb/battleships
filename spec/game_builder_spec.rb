require 'game_builder'

describe GameBuilder do

  let(:player_one){double :player, :'board=' => nil}
  let(:player_two){double :player, :'board=' => nil}
  subject { GameBuilder.new(player_one: player_one, player_two: player_two)}

  it 'adds a board to player_one' do
    expect(player_one).to receive(:'board=')
    subject.add_boards_to_players
  end

  it 'adds players to fleets' do

  end

end
