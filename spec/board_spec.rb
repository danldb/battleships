require 'board'

describe Board do
  subject { Board.new(contents_class: hittable_class)}
  let(:hittable_class){double :hittable_class, new: hittable}
  let(:hittable){double :hittable, hit: :true}
  let(:shot){double :shot}

  it 'has 10 rows' do
    expect(subject.rows.count).to eq 10
  end

  it 'has 10 columns' do
    expect(subject.rows[0].count).to eq 10
  end

  context 'when receiving shoot' do
    it { is_expected.to respond_to(:shoot).with(2).arguments }

    it 'hits a hittable_class' do
      place_hittable
      expect(hittable).to receive(:hit).with(shot)
      subject.shoot([0,0], shot)
    end

    it 'registers a shot' do
      subject.shoot([0,0], shot)
      expect(subject.shots).to include shot
    end

  end

  context 'placing a hittable object' do

    it 'places the hittable object' do
      subject.place(hittable: hittable, coords: [0,0])
      expect(subject.rows[0][0]).to eq hittable
    end

  end

  def place_hittable
    allow(hittable).to receive(:place)
    subject.place(hittable: hittable, coords: [0,0])
  end
end
