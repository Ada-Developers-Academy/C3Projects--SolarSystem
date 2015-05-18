class Planet
  attr_accessor :mass_kg, :diameter_km, :gravity, :rotation_period_hrs, :length_of_day_hrs, :distance_from_sun_km, :orbital_period_days, :mean_temp_c, :num_of_moons

  def initialize(name, planet_hash)
    @name                 = name
    @mass_kg              = planet_hash[:mass_kg]
    @diameter_km          = planet_hash[:diameter_km]
    @gravity              = planet_hash[:gravity]
    @rotation_period_hrs  = planet_hash[:rotation_period_hrs]
    @length_of_day_hrs    = planet_hash[:length_of_day_hrs]
    @distance_from_sun_km = planet_hash[:distance_from_sun_km]
    @orbital_period_days  = planet_hash[:orbital_period_in_days]
    @mean_temp_c          = planet_hash[:mean_temp_c]
    @num_of_moons         = planet_hash[:num_of_moons]
  end
end

class SolarSystem
  def initialize(planet_name, planet_info)
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
end
