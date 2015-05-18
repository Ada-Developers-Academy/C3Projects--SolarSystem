#create Planet class
class Planet
  # create accessor methods for all planet attributes
  attr_accessor :planet_name, :diameter_miles, :num_moons, :color, :rotation

  # initialize each planet as a hash
  def initialize(attribute)
    @planet_name = attribute[:planet_name]
    @diameter_miles = attribute[:diameter_miles]
    @num_moons = attribute[:num_moons]
    @color = attribute[:color]
    @rotation = attribute[:rotation]
  end

end

# create SolarSystem class
class SolarSystem
attr_accessor :solar_system, :formation_year
  def initialize
    @solar_system = {}
    @formation_year = 5 # in earth years
  end

# adds planet into empty @solar_system hash
  def add_planet(planet)
    symbol_name = planet.planet_name
    @solar_system[symbol_name] = planet
  end

# gets planet's age in earth years
  def local_year(planet)
    local_year = @formation_year / (planet.rotation)
  end

# prints out planet's information
  def print_planet(planet)
    age = local_year(planet)
    puts "Here's some interesting info about #{planet.planet_name}!"
    puts "Diameter(miles): #{planet.diameter_miles}"
    puts "Number of moons: #{planet.num_moons}"
    puts "Color: #{planet.color}"
    puts "Age: #{age} billion years old"
  end

end

# create new instances of planet
earth = Planet.new(planet_name: "Earth", diameter_miles: 7926, num_moons: 1, color: "blue", rotation: 1)

venus = Planet.new(planet_name: "Venus", diameter_miles: 7521, num_moons: 0, color: "yellow", rotation: 0.4)

mars = Planet.new(planet_name: "Mars", diameter_mile: 4212, num_moons: 2, color: "red", rotation: 2)

jupiter = Planet.new(planet_name: "Jupiter", diameter_miles: 88846, num_moons: 63, color: "yellow brown", rotation: 11)

# create new instance of solar system
our_galaxy = SolarSystem.new

# add planets into solar system
our_galaxy.add_planet(earth)
our_galaxy.add_planet(venus)
our_galaxy.add_planet(mars)
our_galaxy.add_planet(jupiter)


# prompt to give user choices to select from
puts "Hey! Let's learn about the solar system.\nWhich solar system would you like to learn about?\n1. Earth\n2. Venus\n3. Mars\n4. Jupiter\n5. EXIT"

answer = gets.chomp.to_i

# loop that prints out selected planet's info
until answer == 5
  if answer == 1
    our_galaxy.print_planet(earth)
  elsif answer == 2
    our_galaxy.print_planet(venus)
  elsif answer == 3
    our_galaxy.print_planet(mars)
  elsif answer == 4
    our_galaxy.print_planet(jupiter)
  elsif answer == 5
    exit
  else
    puts "Sorry not a valid number!"
  end

  puts "\nWhich solar system would you like to learn about?\n1. Earth\n2. Venus\n3. Mars\n4. Jupiter\n5. EXIT"
  answer = gets.chomp.to_i
end
