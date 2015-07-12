require 'build_ship'

describe BuildShip do
  let(:battleship){described_class.battleship}

  it 'builds a battleship' do
    expect(battleship.length).to eq 4
  end

  it 'has missing methods' do
    expect{described_class.nonsense}.to raise_error
  end

end
