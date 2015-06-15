require 'ship'

describe Ship do

  it 'is not sunk' do
    expect(subject.sunk?).to be false
  end

  it 'can be sunk' do
    subject.hit
    expect(subject.sunk?).to be true
  end

  it 'can be given coordinates' do
    subject.assign_position [0,0]
    expect(subject.coords).to eq [[0,0]]
  end

  it 'raises error if the ship is off the board' do
    expect{subject.assign_position [10,0]}.to raise_error 'off the board'
  end

  it 'has a length of 1' do
    expect(subject.length).to eq 1
  end

end
