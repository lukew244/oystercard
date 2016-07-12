class Oystercard

  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1
  MINIMUM_FARE = 1
  attr_reader :balance, :entry_station, :history


  def initialize
    @balance = 0
    @entry_station = nil
    @history = []

  end

  def top_up(amount)
    fail "You have reached your maximum allowance of #{MAXIMUM_BALANCE}" if exceeds_max?(amount)
    @balance += amount
  end

  def touch_in(station)
    fail "Not enough funds" if exceeds_min?
    @entry_station = station
    @history << station
  end

  def touch_out
    @entry_station = nil
    deduct(MINIMUM_BALANCE)
  end

  def in_journey?
    !!@entry_station
  end

  def exceeds_max?(amount)
    balance + amount > MAXIMUM_BALANCE
  end

  def exceeds_min?
    balance < MINIMUM_BALANCE
  end

private

def deduct(amount)
  @balance -= amount
end

end
