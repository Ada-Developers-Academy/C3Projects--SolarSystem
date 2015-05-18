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
  def initialize(planets)
    # initializes with number of planets... ex: solar = SolarSystem.new(5) gives 5 different planets
    @planets_array = []
    # creates an array to hold each new planet
    planets.times do
    # runs through the block as many times as specified
    @planets_array.push(Planet.new)
    # places new planets into the array
    end
    puts "Your Solar System has #{@planets_array.length} planets!"
    puts @planets_array
    # shows all the planets in the array

  end
end
