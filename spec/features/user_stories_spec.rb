require 'oystercard'

describe 'user stories' do

  # In order to use public transport
  # As a customer
  # I want money on my card
  it 'so customers can use the card, have a starting balance' do
    card = Oystercard.new
    expect { card.balance }.not_to raise_error
  end

  # In order to keep using public transport
  # As a customer
  # I want to add money to my card
  it 'allows customer to add money to a card' do
    card = Oystercard.new
    expect { card.top_up(10) }.not_to raise_error
  end

end
