require 'shot'
describe Shot do

  let(:shotsrecorder){double :shotsrecorder}
  let(:coord){ [0,0] }
  subject { Shot.new(coord: coord) }

  it {is_expected.to respond_to :register_hit}

  it 'records when it hits' do
    subject.register_hit
    expect(subject.hit?).to eq true
  end

  it 'records when it misses' do
    subject.register_miss
    expect(subject.miss?).to eq true
  end

end
