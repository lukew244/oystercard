class Oystercard

  MAXIMUM_BALANCE = 90
  attr_reader :balance


  def initialize
    @balance = 0
    @maximum = MAXIMUM_BALANCE
  end

  def top_up(amount)
    fail "You have reached your maximum allowance of #{@maximum}" if exceeds_max?(amount)
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end 

  def exceeds_max?(amount)
    balance + amount > @maximum
  end

end
