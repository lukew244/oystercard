class Oystercard

  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1
  MINIMUM_FARE = 1
  attr_reader :balance, :entry_station, :exit_station, :journey, :history


  def initialize
    @balance = 0
    @entry_station = nil
    @journey = {}
    @history = []
  end

  def top_up(amount)
    fail "Cannot top-up: exceeds maximum balance of #{MAXIMUM_BALANCE}" if exceeds_max?(amount)
    @balance += amount
  end

  def touch_in(station)
    fail "Cannot touch in: balance is too low" if exceeds_min?
    @entry_station = station

  end

  def touch_out(station)
    @exit_station = station
    commit_journey_to_history
    @entry_station = nil
    deduct(MINIMUM_FARE)
  end

  def in_journey?
    !!entry_station
  end



private

def commit_journey_to_history
  @journey = { entry_station => exit_station }
  history << journey
end

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
