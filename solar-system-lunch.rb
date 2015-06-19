# Solar System Project

class Planet
  # accessors reads and writes these instance variables
  attr_accessor :planet_hash, :name, :diameter, :mass, :moons, :atmosphere, :rate_of_rotation

  def initialize(planet_qualities = {})
    @name = planet_qualities[:name]
    @diameter = planet_qualities[:diameter]
    @mass = planet_qualities[:mass]
    @moons = planet_qualities[:moons]
    @atmosphere = planet_qualities[:atmosphere]
    @rate_of_rotation = planet_qualities[:rate_of_rotation]
  end

end

class SolarSystem
  attr_accessor :planets
  attr_reader :year_of_creation

  # Upon initiation of a new SolarSystem object you can initiate multiple planets with no attributes
  def initialize(num_planets = 0)
    @year_of_creation = rand(2015) # Automatically assigns the solar system's year of creation
    @num_planets = num_planets
    @planets = []
    @num_planets.times do
      @planets.push(Planet.new)
    end
  end

  # Adds a planet to your solar system -- pass planet attributes as parameters to the add_planet method
  def add_planet(planet_qualities = {})
    new_planet = Planet.new(planet_qualities)
    # Adds the planet to the array of planets in your solar system
    @planets.push(new_planet)
  end

end
