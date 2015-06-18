require 'board'

describe Board do
  let(:cell){double :cell}

  it { is_expected.to respond_to(:shoot).with(1).argument }

  it 'hits a cell' do
    subject.rows[0][0] = cell
    expect(cell).to receive(:hit)
    subject.shoot([0,0])
  end

  it 'has 10 rows' do
    expect(subject.rows.count).to eq 10
  end

  it 'has 10 columns' do
    expect(subject.rows[0].count).to eq 10
  end

  it 'can add a shootable object' do
    subject.store(shootable: cell, coordinate: [0,0])
  end
end
