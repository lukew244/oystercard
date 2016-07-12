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
    message = "You have reached your maximum allowance of 90"
    expect { card.top_up(91) }.to raise_error message
  end


  it 'allows customer to touch in' do
    card.top_up(5)
    expect { card.touch_in }.not_to raise_error
  end

  it 'allows customer to touch out' do
    expect { card.touch_out }.not_to raise_error
  end

  it 'can tell customer if in journey' do
    expect { card.in_journey? }.not_to raise_error
  end

  it 'user must have minimum amount on card' do
    message = "Not enough funds"
    expect { card.touch_in }.to raise_error message
  end


end
