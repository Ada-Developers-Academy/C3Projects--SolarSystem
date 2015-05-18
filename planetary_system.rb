# Planetary System

class Planet

  # user can see what all of these values are after they've make their planet
  attr_reader :name, :num_moons, :mass, :color, :atmosphere

  # These values are set for each planet by user
  def initialize(planets_hash)
    # below are the attributes that are included in planet_instance below
      @name = planets_hash[:name]
      @num_moons = planets_hash[:num_moons]
      @mass = planets_hash[:mass] # in tons
      @color = planets_hash[:color]
      @atmosphere = planets_hash[:atmosphere] # true/false statement
  end

end



class SolarSystem

  attr_reader :planet

  # solar system is empty until you add planets
  def initialize
    @solar_system = {}
  end

  # adding an instance of a planet to the solar system
  def add_planet(planet_variable)
    planet_key = planet_variable.name
    # populates solar system hash
    # with the planet's attributes from the planet's hash
    @solar_system[planet_key] = planet_variable
  end

end
