# create Planet class
class Planet
  attr_accessor :name, :color, :moons, :rings

# Planet attributes
  def initialize(single_planet)
    @name = single_planet[:name]
    @color = single_planet[:color]
    @moons = single_planet[:moons]
    @solar_rotation = single_planet[:solar_rotation]
    @num_of_rings = single_planet[:rings]
  end

end


# create solar system class
class SolarSystem
  attr_reader :planets, :system_age

  # solar system starts with zero planets and a creation year
  def initialize(planet_system)
    # set planets attribute equal to an array to allow planets to "push" into
    @planets = []
    @formation_year = planet_system[:formation_year]
  end

  # add planets into the solar system
  def add_planet(which_planet)
    @planets.push(which_planet)
  end

  # determine how long the solar system has been in existence
  def system_age
    @system_age = 2015 - @formation_year
  end

  # use system age in relation to solar rotation to determine
  # age of a single planet
  def local_age(planet_index)
    system = (self.system_age)
    planet = (@planets[planet_index]).solar_rotation
    puts "#{(@planets[planet_index]).name} is #{system.to_f * (planet.to_f/365)} years old."
  end

end
