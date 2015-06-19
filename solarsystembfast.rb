# breakfast level solar system
# added colorize gem for colorful fun
require 'colorize'

class Planet
  # using accessor will allow values to be added after initialization
  attr_accessor :name, :diameter, :mass, :moons

   def initialize(planet_hash)
     @name = planet_hash[:name]
     @diameter = planet_hash[:diameter]
     @mass = planet_hash[:mass]
     @moons = planet_hash[:moons]
     @rotation = planet_hash[:rotation]
   end

  # can call method to display colorful name if added colorize to the name
  # during initialization or reassigned name with a colorize color.
  def color_name
    puts @name
  end

  # can add existing planets to existing solar systems using this method.
  # e.g. planet.add_system(solar_system)
  def add_system(solarsys)
    solarsys.new_planets.push(self)
  end
end


class SolarSystem
  attr_reader :planet_number, :new_planets
  # new solar systems are initialized as an empty array
  def initialize
    @new_planets = []
    @planet_number = 0
  end

  # create new planets within the solar system, must initialize at least one value
  # from the planet hash--  like name
  def create_planet(planet_hash)
    @new_planets.push(Planet.new(planet_hash))
    @planet_number = (@new_planets.length)
    # see current size of solar system at end of method
    puts "Your solar system has #{@planet_number} planets."
  end

  # add all our solar system's planets with all attributes available to Planet class at once
  # usually add it to a new instance of SolarSystem with variable name "sun"
  def create_system
    @earth = Planet.new(name: "Earth".green.on_blue, diameter: 79, mass: 60, moons: 1, rotation: 1)
    @mars =  Planet.new(name: "Mars".light_red.on_red, diameter: 42, mass: 64, moons: 2, rotation: 1.88)
    @mercury =  Planet.new(name: "Mercury".cyan.on_light_black, diameter: 30, mass: 33, moons: 0, rotation: 0.24)
    @venus =  Planet.new(name: "Venus".yellow.on_white, diameter: 75, mass: 49, moons: 0, rotation: 0.62)
    @jupiter =  Planet.new(name: "Jupiter".red.on_yellow, diameter: 887, mass: 19, moons: 50, rotation: 11.9)
    @saturn =  Planet.new(name: "Saturn".light_red.on_blue, diameter: 749, mass: 57, moons: 53, rotation: 29.5)
    @uranus =  Planet.new(name: "Uranus".light_white.on_light_blue, diameter: 318, mass: 87, moons: 27, rotation: 84)
    @neptune =  Planet.new(name: "Neptune".light_cyan.on_blue, diameter: 308, mass: 10, moons: 13, rotation: 165)
    @pluto =  Planet.new(name: "Pluto".light_black.on_black, diameter: 14, mass: 13, moons: 3, rotation: 248)
    @new_planets.push(@mercury, @venus, @earth, @mars, @jupiter, @saturn, @uranus, @neptune, @pluto)
    @planet_number = (@new_planets.length)
  end

  # see colorize effect for whole solar system eg sun.color_system
  def color_system
   new_planets.each do |planet|
    puts planet.name
    puts "\n"
    end
    puts "Welcome to your new solar system!".blue.blink
  end


end
