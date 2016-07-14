class Journey

  attr_reader :entry_station, :complete


  def initialize(station)
    @entry_station = station
    @journey = {}
    start_journey
    #this will need an if entr station is something, start method

  end

  def finish(station)
    @journey[:exit_station] = station
    fare
    @journey = {}
    #calls fare calculator
  end

  def fare
    fare = 6
    fare = 1 if touched_in_correctly?
    fare
  end

  def complete?
    @journey.empty?
  end

private

  def start_journey
    @journey[:entry_station] = @entry_station#pushes to the array
  end

  def touched_in_correctly?
    @journey.has_key?(:entry_station) && @journey.has_key?(:exit_station)
    #this isn't working - the last store exit station is not working
  end


end
