class Planet
  attr_accessor :mass_kg, :diameter_km, :gravity, :rotation_period_hrs, :length_of_day_hrs, :distance_from_sun_km, :solar_rotation_days, :mean_temp_c, :num_of_moons
  attr_reader :name

  def initialize(name, planet_hash)
    @name                 = name
    @mass_kg              = planet_hash[:mass_kg]
    @diameter_km          = planet_hash[:diameter_km]
    @gravity              = planet_hash[:gravity]
    @rotation_period_hrs  = planet_hash[:rotation_period_hrs]
    @length_of_day_hrs    = planet_hash[:length_of_day_hrs]
    @distance_from_sun_km = planet_hash[:distance_from_sun_km]
    @solar_rotation_days  = planet_hash[:solar_rotation_days]
    @mean_temp_c          = planet_hash[:mean_temp_c]
    @num_of_moons         = planet_hash[:num_of_moons]
  end
end

class SolarSystem
  attr_reader :planets

  def initialize(planet_name, planet_info)
    @formation_yr = 1991
    @planets = []

    # `planet_name` is an array of planet names
    # ex. ["Mercury", "Venus", …]
    # `planet_info` is an array that holds the hashes (`planet_hash`)
    # ex. [{mass_kg: 1.2, diameter_km: 3}, {mass_kg: 2, diameter_km: 4}, …]
    # BN - `planet_name[0]` must correlate with info of `planet_info[0]`
    count = 0
    planet_name.each do |name|
      @planets << Planet.new(name, planet_info[count])
      count += 1
    end
  end

  # made this purely for reference
  # could be unnecessary if `@planets` was a hash instead of an array…
  # how do I make the variable `name` register as a hash key…?
  def planet_list
    puts "Your current array of planets are:"
    count = 0

    @planets.each do |planet|
      puts "@planets[#{count}]: #{planet.name}"
    end
  end

  # computes planet's local year in terms of earth years
  def local_year(planet_index)
    planet = @planets[planet_index]
    present_earth_yr = 2015
    days_in_earth_yr = 365.242
    # based on earth years
    # round this dividend down
    # local years since formation = earth years since formation * local years per 1 earth year
    local_yrs_past = (present_earth_yr - @formation_yr) * (planet.solar_rotation_days / days_in_earth_yr)
    present_local_yr = @formation_yr.floor + local_yrs_past.floor
    puts "The current local year on #{planet.name} is #{present_local_yr}."
  end
end
