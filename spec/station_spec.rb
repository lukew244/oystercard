require 'station'

  describe Station do
    subject(:station) {described_class.new}
    it 'has a zone' do
      expect(station.zone).to eq(1)
    end


  end
