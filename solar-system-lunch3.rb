# Makes gems available
require 'date'
require 'awesome_print'

# initialize Planet class
class Planet
  attr_reader :planet_hash, :name, :moons, :diameter, :has_life, :has_intel_life, :rotation_rate

  def initialize(planet_hash = {})
    @name = planet_hash[:name]
    @moons = planet_hash[:moons]
    @diameter = planet_hash[:diameter]
    @has_life = planet_hash[:has_life]
    @has_intel_life = planet_hash[:has_intel_life]
    @rotation_rate = planet_hash[:rotation_rate]
  end

end

# initialize Solar System class
class SolarSystem
  attr_accessor :num_planets, :planets

  def initialize
    @planets = []
    @num_planets = :num_planets
    @count = 0
    @formation_year = 1979 # sets formation year of Solar System
    puts "This solar system was created in #{@formation_year}"
  end

  # method to add planets using user input
  def add_planets
    puts "How many planets would you like to add?"
    @num_planets = gets.chomp.to_i
    @num_planets.times do |planet|
        @count  += 1
        name_planet
        add_moons
        add_diameter
        add_rotation_rate
        add_has_life
        add_has_intel_life
        @planets.push(Planet.new(name: @name, moons: @moons, diameter: @diameter, rotation_rate: @rotation_rate, has_life: @has_life, has_intel_life: @has_intel_life))
      end
      # Since this is run through irb, uses awesome print to output more clearly
      ap @planets, raw: true, color: {array: :blue}
  end

  # requests each planet name from user and stores info
  def name_planet
    print "\nWould you like to name planet #{@count}? \nAdd name here or press ENTER to move on: "
    name = gets.chomp
    if name.empty? == true
      name = nil
    end
    @name = name
  end

  # requests number of moons of each planet from user and stores info
  def add_moons
    print "How many moons does #{@name} have? \nAdd number here or press ENTER to move on: "
    moons = gets.chomp
    if moons.empty? == true
      moons = nil
    else
      @moons = moons.to_i
    end
  end

  # requests diameter of each planet from user and stores info
  def add_diameter
    print "What is the diameter of #{@name}? \nSpecify here or press ENTER to move on: "
    diameter = gets.chomp
    if diameter.empty? == true
      diameter = nil
    else
      @diameter = diameter.to_i
    end
  end

  # requests rotation rate of each planet from user and stores info
  def add_rotation_rate
    print "If one earth orbit equals 1, how many earth orbits does it take for #{@name} to orbit the sun? \nSpecify here or press ENTER to move on: "
    rotation_rate = gets.chomp
    if rotation_rate.empty? == true
      rotation_rate = nil
    else
      @rotation_rate = rotation_rate.to_f
    end
  end

  # requests y/n of whether each planet has life from user and stores info
  def add_has_life
    print "Is there life on #{@name}? \nType Y or N here, or press ENTER to move on: "
    has_life = gets.chomp
    if has_life.empty? == true
      has_life = nil
    elsif has_life.upcase == "Y" || has_life.upcase == "YES"
      has_life = true
    elsif has_life.upcase == "N" || has_life.upcase == "NO"
      has_life = false
    else
      puts "I do not understand your input, so let's skip this one. You can add it later."
      has_life = nil
    end
    @has_life = has_life
  end

  # requests y/n of whether each planet has intelligent life from user and stores info
  def add_has_intel_life
    print "Is there intelligent life on #{@name}? \nType Y or N here, or press ENTER to move on: "
    has_intel_life = gets.chomp
    if has_intel_life.empty? == true
      has_intel_life = nil
    elsif has_intel_life.upcase == "Y" || has_intel_life.upcase == "YES"
      has_intel_life = true
    elsif has_intel_life.upcase == "N" || has_intel_life.upcase == "NO"
      has_intel_life = false
    else
      puts "I do not understand your input, so let's skip this one. You can add it later."
      has_intel_life = nil
    end
    @has_intel_life = has_intel_life
  end


  # outputs current year on each planet. Uses date gem to get current year on Earth.
  def local_year
    current_year = Date.today.strftime("%Y").to_i
    @time_diff = (current_year - @formation_year)
    @planets.each do |planet|
      orbit = @time_diff * planet.rotation_rate
      local_year = orbit.to_i
      puts "The current year on #{planet.name} is #{local_year}"
    end
    # Since this is run through irb, uses awesome print to output more clearly
    ap @planets, raw: true, color: {array: :blue}
  end

end
