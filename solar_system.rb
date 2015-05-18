require "awesome_print"

class Planet
  attr_accessor :name, :diameter, :moons, :rings, :color, :rotation_rate

  def initialize(planet_hash)
    @name = planet_hash[:name]
    @diameter = planet_hash[:diameter]
    @moons = planet_hash[:moons]
    @rings = planet_hash[:rings]
    @color = planet_hash[:color]
    @rotation_rate = planet_hash[:rotation] # number of rotations per earth year
  end

end

class SolarSystem

  #attribute system that is an empty array
  #define a method that pushes my planets into the array

  attr_accessor :system

  def initialize
    @system = []
    @formation_year = 1950 # earth year
    @current_year = 2015
  end

  def create_planet(planet_hash) #create a planet and add it to the solar system
    @planet_hash = planet_hash
    new_planet = Planet.new(@planet_hash)
    ap @system.push(new_planet)
  end

  def number_of_planets
    puts @system.length #counts the number of elements in the array
  end

  # def local_year( )# need to identify which planet to find local year on
  #   years_passed = @current_year.to_f - @formation_year.to_f
  #   local_year = years_passed * @rotation_rate.to_f
  #   puts local_year
  # end


end
