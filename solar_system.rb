#Creates SolarSystem class
class SolarSystem
  attr_accessor :existing_planets

  # Allows you to customize the number of planets
  def initialize(planet_number)
   @planets = []
   planet_number.times do
     @planets.push(Planet.new)
   end
  end

  # Allows you to check the number of planets
  def planet_total
   @planets.count
  end

end

# For the creation of a single planet
# Hooray for Memory Alpha for attribute inspiration! (http://en.memory-alpha.org/wiki/Planetary_classification)
class Planet
  def initialize(planet_attr = {})
    # These all initialize at nil
    @name = planet_attr[:name]
    @diameter = planet_attr[:diameter]
    @moons = planet_attr[:moons]
    @federation_class = planet_attr[:federation_class]
    @minshara_class = planet_attr[:minshara_class]
  end
end
