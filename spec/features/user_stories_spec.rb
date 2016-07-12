require 'oystercard'

describe 'user stories' do

  # In order to use public transport
  # As a customer
  # I want money on my card
  it 'so customers can use the card, put money on the card' do
    card = Oystercard.new
    expect { card.balance }.not_to raise_error
  end

end
