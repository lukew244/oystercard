require 'journey'

describe Journey do
  subject(:journey) { described_class.new }
  let(:entry_station) { double(:entry_station)}
  let(:exit_station) { double(:exit_station)}

  it { is_expected.to(respond_to(:start).with(1).argument) }

  describe 'start' do
    it 'stores entry station' do
      journey.start(entry_station)
      expect(journey.journey).to eq({:entry_station => entry_station})
    end

  end

  describe 'finish' do
    it 'stores exit station' do
      journey.start(entry_station)
      journey.finish(exit_station)
      expect(journey.journey).to eq({:entry_station => entry_station, :exit_station => exit_station})
    end
  end

  describe '#fare' do
    context 'when journey is complete' do
      it 'returns minimum fare' do
        journey.start(entry_station)
        journey.finish(exit_station)
        expect(journey.fare).to eq(1)
      end
    end
    context 'when journey is not complete' do
      it 'returns penalty fare when exit without entry' do
        journey.finish(exit_station)
        expect(journey.fare).to eq(6)
      end

      it 'returns penaly fare when entry without exit' do
        journey.start(entry_station)
        journey.start(entry_station)
        expect(journey.fare).to eq(6)
      end
    end


  end

  describe 'complete?' do
      context 'journey has started and finished' do
        it 'returns true' do
          journey.start(entry_station)
          journey.finish(exit_station)
          expect(journey).to be_complete
        end
      end
      context 'journey has started and not finished' do
        it 'returns false' do
          journey.start(entry_station)
          expect(journey).not_to be_complete
        end
      end

        context 'journey has not started and has finished' do
          it 'returns false' do
            journey.finish(exit_station)
            expect(journey).not_to be_complete
          end
        end
  end
end
