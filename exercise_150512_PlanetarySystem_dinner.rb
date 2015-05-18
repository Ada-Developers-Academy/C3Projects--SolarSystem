class Planet
  attr_accessor :name, :diameter, :mass, :moon_num, :rotation_rate

  def initialize(planet_hash)
    @name = planet_hash[:name]
    @diameter = planet_hash[:diameter]
    @mass = planet_hash[:mass]
    @moon_num = planet_hash[:moon_num]
    @rotation_rate = planet_hash[:rotation_rate] ## Rotation rate == "orbital period" == the amount of time it takes the planet to make one full orbit around the sun == the "sidereal period". It's a multiplier of the amount of time it takes the earth to travel around the sun.
  end
end


class SolarSystem
  attr_accessor :planets_contained, :formation_year

  def initialize(num, formation_year = 100)
    @planets_contained = [] ## I named it planets_conained rather than planets as asked for in the criteria
    @formation_year = formation_year
    num.times do |n|
      @planets_contained.push(Planet.new(name: "planet#{n+1}"))
    end
  end

  def add_planet(planet)
    @planets_contained.push(planet)
  end

  def add_new_planet(planet_hash) ## This method is sort of redundant. Could use .add_planet instead: my_solar_system.add_planet(Planet.new(name: "whatevs"))
    @planets_contained.push(Planet.new(planet_hash))
  end

  def what_planets
    @planets_contained.map {|planet_n| planet_n.name}
  end

  def planet_year(planet_name)
    earth_years_passed = Time.now.year - @formation_year
    index = @planets_contained.index{ |planet_n| planet_n.name == planet_name }
    rotation_rate = @planets_contained[index].rotation_rate
    planet_years = earth_years_passed / rotation_rate

    puts "#{earth_years_passed} Earth-years have passed since this solar system formed; however, #{planet_name} has rotated around its sun #{planet_years.to_i} times."
  end

end

#### SELECT TESTS #############################################################
# puts "SOLAR A"
# solar_a = SolarSystem.new(3)
# puts "--------break--------"
# puts solar_a.what_planets

# puts "SOLAR B"
# solar_b = SolarSystem.new(1)
# solar_b.add_new_planet(name: "IAmAPlanetName", mass: 100, rotation_rate: 0.240846)
# puts "Here are my planets:"
# puts solar_b.what_planets
# puts

# puts solar_b.planet_year("IAmAPlanetName")

# puts "ADD PLANET TEST"
# planet_b = Planet.new(name: "Planet B", mass: 900, moon_num: 3)
# puts
# solar_b.add_planet(planet_b)
# puts solar_b.what_planets
###############################################################################


#### THIS IS THE BEGINNING OF MY WORK ON DINNER ###############################
# solar_system = SolarSystem.new(0)
# planet_list = [{name: "Mercury", rotation_rate: 0.240846},
#   {name: "Venus", rotation_rate: 0.615},
#   {name: "Earth", rotation_rate: 1},
#   {name: "Mars", rotation_rate: 1.881},
#   {name: "Jupiter", rotation_rate: 11.86},
#   {name: "Saturn", rotation_rate: 29.46},
#   {name: "Uranus", rotation_rate: 84.01},
#   {name: "Neptune", rotation_rate: 164.8}
# ]

# planet_list.each do |planet_n|
#   solar_system.planets_contained.push(Planet.new(planet_n))
# end

# puts "Hello! Let's learn about planets! Which planet would you like to learn about? [Provide the planet name or number.]"

# #puts <list>

# # user_planet = gets.chomp
# # if user_planet.class == FixNum ## Try `===` if doesn't work
# #   # Use to select indices
# # elsif user_planet.class == String ## Try `===` if doesn't work
# #   # Use to find indices. Use .capitalize or whatever
# # else
# #   # unknown error, try putting in a number or a planet name
# # # Return info about the planet
