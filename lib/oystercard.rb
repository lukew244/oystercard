class Oystercard

attr_reader :balance

DEFAULT_AMOUNT = 0
MAXIMUM_BALANCE = 90

  def initialize(balance = DEFAULT_AMOUNT)
    @balance = balance

  end

  def top_up(amount)
    fail error_message if maximum_balance_exceeded(amount)
    @balance += amount
  end

  def maximum_balance_exceeded(amount) #this is a little repetitive?
    (@balance + amount) > MAXIMUM_BALANCE
  end

  def error_message
    maximum_balance = MAXIMUM_BALANCE
    "Exceeds maximum balance of #{maximum_balance}"
  end

end
