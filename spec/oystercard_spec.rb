require 'oystercard'

describe Oystercard do

  it 'has no money to start' do
    expect(subject.balance).to eq(0)
  end

  it 'tops up card' do
    expect{subject.top_up(10)}.to change {subject.balance}.by 10
  end

  it 'enforces a maximum balance' do
    maximum_balance = Oystercard::MAXIMUM_BALANCE
    subject.top_up(maximum_balance)
    expect{subject.top_up(1)}.to raise_error "Exceeds maximum balance of #{maximum_balance}"
  end

end
