require 'fleet'

describe Fleet do

  SHIPS = {aircraft_carrier: 1,
          battleship: 1,
          submarine: 1,
          destroyer: 1,
          patrol_boat: 1}

  let(:player){double :player, report_destroyed: nil}
  let(:ship){double :ship, type: :battleship}
  let(:shipclass){double :shipclass, new: ship}

  subject { Fleet.new(ships: SHIPS, player: player, shipclass: shipclass) }

  it 'has 5 ships' do
    expect(subject.ships.count).to eq 5
  end

  it 'registers a sunk ship' do
    subject.register_sunk(ship)
    expect(subject.ships).not_to include ship
  end

  it 'reports when all ships are sunk' do
    expect(player).to receive(:report_destroyed)
    sink_all_ships
  end

  def sink_all_ships
    subject.register_sunk(ship)
  end

end
