# Elsa's solar system
# Due: 150513
# Breakfast


# Planet
class Planet
  attr_reader :name, :mass, :orbital_speed, :solar_days, :satellites
  # irb: earth = Planet.new(name: "earth", etc)
  def initialize(planets_hash)
    @name = planets_hash[:name]
    @mass = planets_hash[:mass]
    @orbital_speed = planets_hash[:orbital_speed]
    @solar_days = planets_hash[:solar_days]
    @satellites = planets_hash[:satellites]
  end

end # end Planet class


# Solar System
class SolarSystem
  attr_accessor :planets
  # irb: system = SolarSystem.new
  def initialize
    @planets = []
  end

  # Populates solar system
  # irb: system.populate([earth, etc])
  def populate(astronomical_objects)
    @planets.push(astronomical_objects)
  end

end # end SolarSystem class
