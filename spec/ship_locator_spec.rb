require 'ship_locator'

describe ShipLocator do
  let(:ship) { double :ship, length: 3 }

  let(:vertical_ship_hash) do
    {ship: ship, orientation: :vertical, seed: [0,0]}
  end

  let(:horizontal_ship_hash) do
    {ship: ship, orientation: :horizontal, seed: [0,0]}
  end

  it 'can return vertical ship coordinates' do
    expect(subject.generate_coords(vertical_ship_hash)).to eq [[0,0],[0,1],[0,2]]
  end

  it 'can return horizontal ship coordinates' do
    expect(subject.generate_coords(horizontal_ship_hash)).to eq [[0,0],[1,0],[2,0]]
  end

  it 'will raise error if ship overlaps' do
    subject.generate_coords(vertical_ship_hash)
    expect{subject.generate_coords(horizontal_ship_hash)}.to raise_error 'there is already a ship there'
  end

  it 'will raise error if ship falls off the board' do
    expect{subject.generate_coords({ship: ship, orientation: :horizontal, seed: [9,0]})}
    .to raise_error 'that is outside the playable area'
  end

end
