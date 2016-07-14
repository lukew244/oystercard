require 'journey'

describe Journey do
  subject(:journey) {described_class.new(station)}
  let(:station) {double :station}

#journey(entry_station = station)
#journey.finish
#journey.fare
#journey.complete?


  it 'can be passed a station' do
    expect(journey.entry_station).to eq(station)
  end

  it 'knows if a journey has started' do
    expect(journey.complete?).to be false
  end

  it 'knows if a journey has ended' do
    journey.finish(station)
    expect(journey.complete?).to be true
  end

  context 'when the customer has touched in correctly' do
    it 'gives the minimum fare' do
      expect(journey.fare).to eq(1)
    end
  end

  context 'when the customer has not touched in correctly' do
    it 'gives the penalty fare' do
      expect(journey.fare).to eq(6)
    end
  end


end
