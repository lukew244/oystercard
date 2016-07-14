class Journey
  MIN_FARE = 1
  PENALTY_FARE = 6

  def initialize
    @journey = {}
  end

  def start(entry_station)

    @journey[:entry_station] = entry_station
    @journey
  end

  def finish(exit_station)
      @journey[:exit_station] = exit_station
      fare
  end

  def journey
    correct = @journey
    @journey = {}
    correct
  end

  def fare
    complete? ? MIN_FARE : PENALTY_FARE
  end

  def complete?
    @journey.has_key?(:entry_station) && @journey.has_key?(:exit_station)

  end

end
