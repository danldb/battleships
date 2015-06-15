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
    expect(subject.length).to eq 1
  end



end
