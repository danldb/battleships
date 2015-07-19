require 'ship'

describe Ship do
  let(:fleet){double :fleet, register_sunk: nil}
  let(:shot){double :shot, register_hit: nil, register_kill: nil}
  subject { Ship.new(type: :patrol_boat, fleet: fleet) }

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

  it 'notifies shot when it is sunk' do
    expect(shot).to receive(:register_kill).with(subject).once
    sink_ship
  end

  it 'notifies its fleet when it is sunk' do
    expect(fleet).to receive(:register_sunk).with(subject).once
    sink_ship
  end

  def sink_ship
    subject.hit(shot)
    subject.hit(shot)
  end
end
