require 'oystercard'

describe Oystercard do
  subject(:oystercard) {described_class.new}

  it 'has money on the card' do
    expect(oystercard).to respond_to(:balance)
  end
end
