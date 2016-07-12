class Oystercard

  DEFAULT_MAXIMUM = 90
  attr_reader :balance


  def initialize
    @balance = 0
    @maximum = DEFAULT_MAXIMUM
  end

  def top_up(amount)
    fail "maximum balance reached" if exceeds_max?(amount)
    @balance += amount
  end

  def exceeds_max?(amount)
    balance + amount > @maximum
  end

end
