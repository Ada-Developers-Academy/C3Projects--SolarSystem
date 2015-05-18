require "awesome_print"

class Planet
  attr_accessor :name, :diameter, :moons, :rings, :color

  def initialize(planet_hash)
    @name = planet_hash[:name]
    @diameter = planet_hash[:diameter]
    @moons = planet_hash[:moons]
    @rings = planet_hash[:rings]
    @color = planet_hash[:color]
  end

end

class SolarSystem

  #attribute system that is an empty array
  #define a method that pushes my planets into the array

  attr_accessor :system

  def initialize
    @system = []
  end

  def create_planet(planet_hash) #create a planet and add it to the solar system
    @planet_hash = planet_hash
    new_planet = Planet.new(@planet_hash)
    ap @system.push(new_planet)
  end

  def number_of_planets
    puts @system.length #counts the number of elements in the array
  end

end
