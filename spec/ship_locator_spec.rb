require 'ship_locator'

describe ShipLocator do
  let(:ship) { double :ship, length: 3 }
  
  let(:ship_hash) do
    {ship: ship, orientation: :vertical, seed: [0,0]}
  end

  it 'can return ship coordinates' do
    expect(subject.generate_coords(ship_hash)).to eq [[0,0],[0,1],[0,2]]
  end

end
