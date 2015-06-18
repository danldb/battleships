require 'player'

describe Player do
  let(:target){double :target}
  subject { Player.new(target) }
  
  it 'can shoot a shootable target' do
    expect(target).to receive(:shoot)
    subject.shoot([0,0])
  end

end
