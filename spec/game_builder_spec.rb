require 'game_builder'

describe GameBuilder do

  let(:player_one){double :player, :'board=' => nil}
  let(:player_two){double :player, :'board=' => nil}
  let(:fleetclass){double :fleetclass, new: nil}
  subject { GameBuilder.new(player_one: player_one, player_two: player_two, fleetclass: fleetclass)}

  it 'adds a board to player_one' do
    expect(player_one).to receive(:'board=')
    subject.generate_boards
  end

  it 'adds players to fleets' do
    expect(fleetclass).to receive(:new)
    subject.generate_fleets
  end

end
