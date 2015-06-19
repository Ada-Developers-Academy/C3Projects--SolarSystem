# creating the Planet class to hold all of the different planets and their attributes
class Planet
  #setting up the following so that I can read and write to it later (I want to be able to call a value by its key)
  attr_accessor :name, :size, :distance, :color, :inhabitable, :formation, :rotation, :moons, :water
  #setting Planet as a hash so the user can enter values based on key
  def initialize (planet_hash)
    @name = planet_hash[:name]
    @size = planet_hash[:size]
    @distance = planet_hash[:distance]
    @color = planet_hash[:color]
    @inhabitable = planet_hash[:inhabitable]
    @rotation = planet_hash[:rotation]
    @moons = planet_hash[:moons]
    @water = planet_hash[:water]
    @earth_age = planet_hash[:earth_age]
    @formation = 4_540_000_000 #approximate age of the earth
  earth_age
  end

  def earth_age
    earth_age = @formation / @rotation
    @earth_age = earth_age
  end
end

#creating the SolarSystem class to hold all of the planets and be able to call functions on them
class SolarSystem
  #setting up planets as an item that can be called/viewed later
attr_reader :planets
#instantiating the instance variable of planets
  def initialize
    @planets = [zorbitron, cheesetopia, rumplestilts]
  end

#defining each planet
  def zorbitron
    planet_1 = Planet.new(name: "Zorbitron", size: "250 kilograms", distance: "3.2 lightyears", color: "electric orange", inhabitable: false, rotation: 2, moons: 8, water: false)
  end

  def cheesetopia
    planet_2 = Planet.new(name: "Cheesetopia", size: "475 million tons", distance: "1.6 lightyears", color: "creamy white", inhabitable: true, rotation: 1.25, moons: 2, water: true)
  end

  def rumplestilts
    planet_3 = Planet.new(name: "Rumplestilts", size: "800,000 tons", distance: "4 lightyears", color: "Purplicious", inhabitable: false, rotation: 6, moons: 0, water: false)
  end
end
