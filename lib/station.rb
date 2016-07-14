class Station

  DEFAULT_ZONE = 1
  
  attr_reader :zone, :name

  def initialize(name, zone = DEFAULT_ZONE)
    @name = name
    @zone = zone
  end

end
