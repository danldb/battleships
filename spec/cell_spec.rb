require 'cell'

describe Cell do

  let(:hittable){double :hittable}
  before(:each){subject.hold(hittable)}

  it 'can hit a hittable object' do
    expect(hittable).to receive(:hit)
    subject.shoot
  end

  it "won't hit its contents multiple times" do
    expect(hittable).to receive(:hit).once
    subject.shoot
    subject.shoot
  end
end
