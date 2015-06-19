require 'colorize'

class Planet
  attr_accessor :name, :color, :mass_kg, :rotation_period_hrs, :length_of_day_hrs, :distance_from_sun_km, :solar_rotation_days, :mean_temp_c, :num_of_moons

  def initialize(name, planet_hash)
    @name                 = name
    @color                = planet_hash[:color].to_sym
    @mass_kg              = planet_hash[:mass_kg]
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
      # for *some* reason, `:blue` doesn't work as an instance variable
      # totally works if you replace `@color` with `:blue`
      puts "@planets[#{count}]: " + planet.name.colorize(@color)
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

# ----------------------------------------------

# Query Program
# Jeremy suggested a cheater method to have info to work with
planet_info = [{name: "Mercury", color: :red, mass: "0.330 * 10^24 kg", diameter: "4879 km", length_of_day: "4222.6 hrs", distance_from_sun: "57.9 * 10^6 km"},
               {name: "Venus", color: :magenta, mass: "4.87 * 10^24 kg", diameter: "12,104 km", length_of_day: "2802 hrs", distance_from_sun: "108.2 * 10^6 km"},
               {name: "Earth", color: :blue, mass: "5.97 * 10^24 kg", diameter: "5243 km", length_of_day: "24 hrs", distance_from_sun: "149.6 * 10^6 km"}
]

puts "Hello, student!"
answer = "yes"

while answer == "yes" || answer == "y"
  puts "\nWhat planet would you like to learn about?\nYou can select from the following:"

  count = 0
  planet_info.each do |planet|
    puts "#{count + 1}. #{planet_info[count][:name].colorize(planet_info[count][:color])}"
    count +=1
  end

  puts "…or you can refuse this plethora of knowledge by typing 'exit'."
  response = gets.chomp

  if response == "exit"
    puts "\nFine, but you'll be sorry when this planet shrivels up and dies."
    exit
  else
    # then ask for another planet
    puts "\nCool! Let's learn!"
    case response
    when "1", "mercury", "Mercury"
      index = 0
    when "2", "venus", "Venus"
      index = 1
    when "3", "earth", "Earth"
      index = 2
    end

    # error with `index`: no implicit conversion from nil to integer
    puts "\n++++++++++++++++++++++++++++++++++++"
    puts "++++++++++++ #{planet_info[index][:name].colorize(planet_info[index][:color])} ++++++++++++".center(50)
    puts "++++++++++++++++++++++++++++++++++++"
    puts "mass: #{planet_info[index][:mass]}"
    puts "diameter: #{planet_info[index][:diameter]}"
    puts "length of day: #{planet_info[index][:length_of_day]}"
    puts "distance from sun: #{planet_info[index][:distance_from_sun]}\n "
  end

  puts "Would you like to learn about more planets? (y/n)"
  answer = gets.chomp
end

if answer == "no" || answer == "n"
  exit
elsif answer != "yes" || answer != "no" || answer != "y" || answer != "n"
  puts "That wasn't a valid answer. YES or NO?"
  answer = gets.chomp
end

exit
