class Oystercard

  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1
  START_BALANCE = 0
  MINIMUM_FARE = 1
  attr_reader :balance, :journey


  def initialize
    @balance = START_BALANCE
    @journey = []

  end

  def top_up(amount)
    fail "Cannot top-up: exceeds maximum balance of #{MAXIMUM_BALANCE}" if exceeds_max?(amount)
    @balance += amount
  end

  def touch_in(station)
    fail "Cannot touch in: balance is too low" if exceeds_min?
    @journey << { entry_station: station }
  end

  def touch_out(station)
    @journey.last.store(:exit_station, station)
    deduct(MINIMUM_FARE)
  end

  def in_journey?
    !journey.last.include? :exit_station
  end

private

  def exceeds_max?(amount)
    balance + amount > MAXIMUM_BALANCE
  end

  def exceeds_min?
    balance < MINIMUM_BALANCE
  end

  def deduct(amount)
    @balance -= amount
  end

end
