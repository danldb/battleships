require 'player'

describe Player do
  let(:target){double :target}
  let(:shot){double :shot}
  let(:game){double :game}
  let(:shotclass){double :shotclass, new: shot}
  subject { Player.new(shootable: target, shotclass: shotclass) }

  it 'can shoot a shootable target' do
    expect(target).to receive(:shoot).with(coords: [0,0],shot: shot)
    subject.shoot([0,0])
  end

  it 'cannot shoot the same coord twice' do
    allow(target).to receive(:shoot).once
    subject.shoot([0,0])
    expect(target).not_to receive(:shoot)
    subject.shoot([0,0])
  end

  it 'adds itself as an argument to a shot' do
    allow(target).to receive(:shoot)
    expect(shotclass).to receive(:new).with(coords: [0,0], player: subject)
    subject.shoot([0,0])
  end

  it 'can lose a game' do
    subject.game = (game)
    expect(game).to receive(:lose_game).with(subject)
    subject.report_destroyed
  end

end
