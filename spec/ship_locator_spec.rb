require 'ship_locator'

describe ShipLocator do
  let(:ship) { double :ship, length: 3 }
  let(:board) {double :board, place: nil}
  subject {ShipLocator.new(board: board)}

  let(:vertical_ship_hash) do
    {ship: ship, orientation: :vertical, seed: [0,0]}
  end

  let(:horizontal_ship_hash) do
    {ship: ship, orientation: :horizontal, seed: [0,0]}
  end

  let(:off_the_board) do
    {ship: ship, orientation: :vertical, seed: [9,0]}
  end

  it 'can return horizontal ship coordinates' do
    expect_board_to_receive([[0,0],[0,1],[0,2]])
    subject.place_ship(horizontal_ship_hash)
  end

  it 'can return vertical ship coordinates' do
    expect_board_to_receive([[0,0],[1,0],[2,0]])
    subject.place_ship(vertical_ship_hash)
  end

  it 'will raise error if ship overlaps' do
    subject.place_ship(horizontal_ship_hash)
    expect{subject.place_ship(vertical_ship_hash)}
    .to raise_error 'there is already a ship there'
  end

  it 'will raise error if ship falls off the board' do
    expect{subject.place_ship(off_the_board)}
    .to raise_error 'that is outside the playable area'
  end

  it 'places a ship' do
    expect_board_to_receive([[0,0],[1,0],[2,0]])
    subject.place_ship(vertical_ship_hash)
  end

  def expect_board_to_receive(coords)
    expect(board).to receive(:place).with(hittable: ship, coords: coords)
  end

end
