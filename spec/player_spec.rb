require 'player'

describe Player do
  let(:target){double :target}
  let(:shot){double :shot}
  let(:shotclass){double :shotclass, new: shot}
  subject { Player.new(shootable: target, shotclass: shotclass) }

  it 'can shoot a shootable target' do
    expect(target).to receive(:shoot).with([0,0],shot)
    subject.shoot([0,0])
  end

  it 'cannot shoot the same coord twice' do
    allow(target).to receive(:shoot).once
    subject.shoot([0,0])
    expect(target).not_to receive(:shoot)
    subject.shoot([0,0])
  end

end
