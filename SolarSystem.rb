# Projest Solar System. Breakfast level
require "colorize"

class Planet
  attr_accessor :name, :distance, :radius, :mass, :rotation

  def initialize(planets)
    @name = planets[:name]
    @distance = planets[:distance]
    @radius = planets[:radius]
    @mass = planets[:mass]
    @rotation = planets[:rotation]
  end
end


class Solar_system

  def initialize
    @planet = {}
  end

  def add_planet(constant_var_planet)
    key = constant_var_planet.name
    @planet[key] = constant_var_planet
    puts @planet
  end
end


# Earth parameters set up to 1.0, as the other planets' parameters are calculated in camparison to the Earth
# Creating objects of class Planet

earth = Planet.new(name:"Earth", distance: 1.0, radius:1.0, mass:1.00, rotation: 1.0)
mercury = Planet.new(name:"Mercury", distance: 0.39, radius: 0.38, mass: 0.05, rotation: 58.8)
venus = Planet.new(name:"Venus", distance: 0.72, radius: 0.95, mass: 0.89, rotation: 244)
mars = Planet.new(name:"Mars", distance: 1.5, radius: 0.53, mass: 0.11, rotation: 1.029)
jupiter = Planet.new(name:"Jupiter", distance: 5.2, radius: 11, mass: 318, rotation: 0.411)
saturn = Planet.new(name:"Saturn", distance: 9.5, radius: 9, mass: 95, rotation: 0.428)
uranus = Planet.new(name:"Uranus", distance: 19.2, radius: 4, mass: 17, rotation: 0.748)
neptune = Planet.new(name:"Neptune", distance: 30.1, radius: 4, mass: 17, rotation: 0.802)

# solar_system = Solar_system.new ------Creating object of class Solar_system
# solar_system = Solar_system.new.add_planet(attr) ------Calling method add_planet

puts solar_system = Solar_system.new.add_planet(earth)
puts solar_system = Solar_system.new.add_planet(mercury)
puts solar_system = Solar_system.new.add_planet(venus)
puts solar_system = Solar_system.new.add_planet(mars)
puts solar_system = Solar_system.new.add_planet(jupiter)
puts solar_system = Solar_system.new.add_planet(saturn)
puts solar_system = Solar_system.new.add_planet(uranus)
puts solar_system = Solar_system.new.add_planet(neptune)
