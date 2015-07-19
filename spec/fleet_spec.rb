require 'fleet'

describe Fleet do

  SHIPS = {aircraft_carrier: 1,
          battleship: 1,
          submarine: 1,
          destroyer: 1,
          patrol_boat: 1}

  subject { Fleet.new(SHIPS) }

  it 'has 5 boats' do
    expect(subject.ships.count).to eq 5
  end

  it "has the correct ships" do
    SHIPS.each do |ship, quantity|
      expect(subject.ships.select{|this_ship| this_ship == ship }.count).to eq quantity
    end
  end

end
