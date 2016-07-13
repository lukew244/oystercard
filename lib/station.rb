class Station

  DEFAULT_ZONE = 1
  attr_reader :zone

  def initialize(zone = DEFAULT_ZONE)
    @zone = zone
  end

end
