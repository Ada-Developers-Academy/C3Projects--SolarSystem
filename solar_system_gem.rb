require "awesome_print"

class Planet
  attr_accessor :name, :diameter, :mass, :moons, :solar_system

  def initialize(planet_hash)
    @name = planet_hash[:name]
    @diameter = planet_hash[:diameter]
    @mass = planet_hash[:mass]
    @moons = planet_hash[:moons]
    @rotation_rate = planet_hash[:rotation]
    @solar_rotation = planet_hash[:solar_rotation]
    @solar_system = planet_hash[:solar_system]
    ap planet_hash
  end

  def local_year
    current_year = Time.now.year
    age_in_earth_years = current_year - @solar_system.formation_year
    puts "age in earth years is #{age_in_earth_years}"
    @local_year = ((age_in_earth_years * 365) / (@solar_rotation))
    puts "The local year in earth years is #{@local_year}"
  end
end

class SolarSystem
  attr_reader :solar_system, :planet_count
  attr_accessor :formation_year

  def initialize
    @solar_system =[]
    @planet_count = @solar_system.length
  end

  def add_planet(planet)
    @solar_system.push(planet)
    @planet_count = solar_system.length
    puts "Your Solar System has #{@planet_count} planets"
    ap @solar_system, options = {raw: true}
  end
end
