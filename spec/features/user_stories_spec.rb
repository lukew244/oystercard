require 'oystercard'

describe 'user stories' do
  let(:card) {Oystercard.new}

  # In order to use public transport
  # As a customer
  # I want money on my card
  it 'so customers can use the card, have a starting balance' do
    expect { card.balance }.not_to raise_error
  end

  # In order to keep using public transport
  # As a customer
  # I want to add money to my card
  it 'allows customer to add money to a card' do
    expect { card.top_up(10) }.not_to raise_error
  end

  it 'throws an error when maximum balance exceeded' do
    expect { card.top_up(91) }.to raise_error "maximum balance reached"
  end

end
