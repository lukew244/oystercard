class Oystercard

  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1
  MINIMUM_FARE = 1
  attr_reader :balance


  def initialize
    @balance = 0
    @maximum_balance = MAXIMUM_BALANCE
    @minimum_balance = MINIMUM_BALANCE
    @minimum_fare = MINIMUM_FARE
    @in_journey = false

  end

  def top_up(amount)
    fail "You have reached your maximum allowance of #{@maximum_balance}" if exceeds_max?(amount)
    @balance += amount
  end

  def touch_in
    fail "Not enough funds" if exceeds_min?
    @in_journey = true
  end

  def touch_out
    @in_journey = false
    deduct(@minimum_fare)
  end

  def in_journey?
    @in_journey
  end

  def exceeds_max?(amount)
    balance + amount > @maximum_balance
  end

  def exceeds_min?
    balance < @minimum_balance
  end

private

def deduct(amount)
  @balance -= amount
end

end
