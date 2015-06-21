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

  def to_s
   "Planet: #{@name} distance: #{@distance} radius: #{@radius} mass: #{@mass} rotation: #{@rotation}"
  end
end


class Solar_system
attr_reader :planets

  def initialize
    @planets = {}
  end

  def add_planet(constant_var_planet)
    key = constant_var_planet.name
    @planets[key] = constant_var_planet
  end
end


# Earth parameters set up to 1.0, as the other planets' parameters are calculated in camparison to the Earth
# Creating objects of class Planet

earth = Planet.new(name:"Earth".colorize(:green).on_blue, distance: 1.0, radius:1.0, mass:1.00, rotation: 1.0)
mercury = Planet.new(name:"Mercury".colorize(:yellow), distance: 0.39, radius: 0.38, mass: 0.05, rotation: 58.8)
venus = Planet.new(name:"Venus".colorize(:yellow).on_red, distance: 0.72, radius: 0.95, mass: 0.89, rotation: 244)
mars = Planet.new(name:"Mars".colorize(:red), distance: 1.5, radius: 0.53, mass: 0.11, rotation: 1.029)
jupiter = Planet.new(name:"Jupiter".colorize(:red), distance: 5.2, radius: 11, mass: 318, rotation: 0.411)
saturn = Planet.new(name:"Saturn".colorize(:yellow), distance: 9.5, radius: 9, mass: 95, rotation: 0.428)
uranus = Planet.new(name:"Uranus".colorize(:light_blue), distance: 19.2, radius: 4, mass: 17, rotation: 0.748)
neptune = Planet.new(name:"Neptune".colorize(:blue), distance: 30.1, radius: 4, mass: 17, rotation: 0.802)


# Creating object of class Solar_system
solar_system = Solar_system.new

# Adding planets to solar_system by calling method add_planet
# EARTH:
solar_system.add_planet(earth)
puts solar_system.planets[earth.name]

# MERCURY
solar_system.add_planet(mercury)
puts solar_system.planets[mercury.name]

# MARS
solar_system.add_planet(mars)
puts solar_system.planets[mars.name]

# JUPITER
solar_system.add_planet(jupiter)
puts solar_system.planets[jupiter.name]

# SATURN
solar_system.add_planet(saturn)
puts solar_system.planets[saturn.name]

# URANUS
solar_system.add_planet(uranus)
puts solar_system.planets[uranus.name]

# NEPTUNE
solar_system.add_planet(neptune)
puts solar_system.planets[neptune.name]
