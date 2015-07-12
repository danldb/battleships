require 'ship'

describe Ship do

  let(:shot){double :shot, register_hit: nil}

  it 'will not be sunk if it still has lives' do
    expect(shot).not_to receive(:register_kill)
    subject.hit(shot)
  end

  it 'has a length of 2' do
    expect(subject.length).to eq 2
  end

  it 'registers a hit' do
    expect(shot).to receive(:register_hit)
    subject.hit(shot)
  end

  it 'notifies when it is sunk' do
    expect(shot).to receive(:register_kill).with(subject).once
    subject.hit(shot)
    subject.hit(shot)
  end


end
