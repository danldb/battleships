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
      expect(count_ships(type: ship)).to eq quantity
    end
  end

  def count_ships(type:)
    subject.ships.select{|ship| type == ship }.count
  end

end
