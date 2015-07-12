require 'ship'

describe Ship do

  it 'is not sunk' do
    expect(subject.sunk?).to be false
  end

  it 'can be sunk' do
    subject.hit
    expect(subject.sunk?).to be true
  end

  it 'has a length of 1' do
    expect(subject.length).to eq 2
  end

  it 'can receive a shot'

  it 'can send notification that it has been sunk'


end
