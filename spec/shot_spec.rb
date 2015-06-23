require 'shot'
describe Shot do

  let(:player){double :player}
  let(:ship){double :ship}
  let(:coord){ [0,0] }
  subject { Shot.new(coord: coord, player: player) }

  it {is_expected.to respond_to :register_hit}
  it {is_expected.to respond_to :register_miss}


  it 'informs player of a miss' do
    expect(player).to receive(:register_miss).with(coord)
    subject.register_miss
  end

  it 'informs player of hit' do
    expect(player).to receive(:register_hit).with(coord)
    subject.register_hit
  end

  it 'informs player of a confirmed kill' do
    expect(player).to receive(:register_kill).with(ship)
    subject.register_kill(ship)
  end

end
