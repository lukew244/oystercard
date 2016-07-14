require_relative 'journey'

class Oystercard
  MAX_BALANCE = 90
  MIN_FARE = 1
  MIN_AMOUNT = 1
  START_BALANCE = 0
  attr_reader :balance
  attr_reader :journey_log

  def initialize
    @balance = START_BALANCE
    @journey_log = []
    @journey = Journey.new
  end

  def top_up(amount)
    raise "Maximum balance of £#{MAX_BALANCE} exceeded" if (@balance + amount) > MAX_BALANCE
    @balance += amount
  end

  def touch_in(entry_station)
    raise "Card needs at least £#{MIN_AMOUNT} to touch in" if @balance < MIN_AMOUNT
    @journey.start(entry_station)
  end

  def touch_out(exit_station)
    deduct_fare(@journey.finish(exit_station))
    #deduct_fare(MIN_FARE)
    add_to_log
  end

  private

  def deduct_fare(fare)
    @balance -= fare
  end

  def add_to_log
    @journey_log << @journey.journey
  end

end
