class Planet
  attr_reader :name, :mass, :moons, :age, :temperature
  #attributes of each planet
  def initialize(planet_hash ={})
  # initialize using a hash
    @name = planet_hash[:name]
    @mass = planet_hash[:mass]
    @moons = planet_hash[:moons]
    @age = planet_hash[:age]
    @temperature = planet_hash[:temperature]
  end
end

class SolarSystem
  attr_reader :planets
  def initialize(planet_count)
    # initializes with number of planets in the SolarSystem
    @planets = []
    planet_count.times do

    @planets.push(Planet.new)
    end

    puts "Your Solar System has #{@planets.length} planets!"
    puts @planets
    # shows all the planets in the array

  end
end
