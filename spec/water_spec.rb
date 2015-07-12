require 'water'

describe Water do

  let(:shot){double :shot}

  it { is_expected.to respond_to(:hit).with(1).argument}

  it 'registers a miss' do
    expect(shot).to receive(:register_miss)
    subject.hit(shot)
  end

end
