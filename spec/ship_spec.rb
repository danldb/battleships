require 'ship'

describe Ship do

  subject { Ship.new(type: :patrol_boat) }

  let(:shot){double :shot, register_hit: nil}

  it 'has a type' do
    expect(subject.type).to eq :patrol_boat
  end
  it 'has a length of 2' do
    expect(subject.length).to eq 2
  end

  it 'registers a hit' do
    expect(shot).to receive(:register_hit)
    subject.hit(shot)
  end

  it 'will not be sunk if it still has lives' do
    expect(shot).not_to receive(:register_kill)
    subject.hit(shot)
  end

  it 'notifies when it is sunk' do
    expect(shot).to receive(:register_kill).with(subject).once
    subject.hit(shot)
    subject.hit(shot)
  end


end
