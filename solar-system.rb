#
#
#                   * * * * * * * * * * * * * * * * *
#                   *                               *
#                   *      Solar System project     *
#                   *  Dr. Vonn Jerry XLII edition  *
#                   *                               *
#                   * * * * * * * * * * * * * * * * *
#
#
# NOTE: If you want to fool around with this in irb/pry/etc, comment out the
#       last line & assign the result of get_known_universe to a variable. There
#       are a lot more things to play with in a toolbox like that. --Jeri
#
# note to self:
#
# * reusing some of these numbers:
#   https://github.com/drvonnjerryxlii/drvonnjerryxlii.github.io/tree/master/solarSystem
#
# * also:
#    * SUN https://solarsystem.nasa.gov/planets/profile.cfm?Object=Sun&Display=Facts
#    * MOONS http://burro.astr.cwru.edu/stu/jupiter_moons.html + google's built-in calculator
#    * AGE http://www.universetoday.com/33740/how-old-is-mercury/ all 4.6bil
#    * DISTANCE http://www.universetoday.com/15462/how-far-are-the-planets-from-the-sun/
#
#--------------------------- begin MOON CLASS SECTOR ---------------------------

class Moon
  attr_reader :day, :distance, :exports, :name, :number, :planet, :sentience,
    :size, :year

  def initialize(moon_hash)
    #----------- INITIALIZE BASE VALUES ----------
    @day           = moon_hash[:day]
    @distance      = moon_hash[:distance]
    @exports       = moon_hash[:exports]
    @name          = moon_hash[:name]
    @number        = moon_hash[:number]
    @sentience     = moon_hash[:sentience]
    @size          = moon_hash[:size]
    @symbol        = moon_hash[:symbol]
    @year          = moon_hash[:year]

    #----------- UPDATE INITIALIZED VALUES ----------
    update_day
    update_sentience
  end

  def orbits(planet_name)
    if planet_name.class == Planet
      planet_name.moons[@symbol] = self
    else
      puts "Moons can only orbit planets."
    end

    set_local_year(4_600_000_000) # !W workaround, other option broken
    set_planet_name(planet_name.name)
  end

  #----------- DESCRIBERS ----------

  def describe
    puts "This is a moon named #{ @name }! It orbits planet #{ planet.name }."
    puts "Its primary exports are #{ @exports[:primary] }."
  end

  def distance_from(something) #!W when learn inheritance, can has master class
    if something.distance > @distance
      distance_au = (something.distance - @distance).round(3)
    elsif something.distance < @distance
      distance_au = (@distance - something.distance).round(3)
    else
      return "Are you sure those are different objects?"
    end

    distance_miles = convert_au_to_miles(distance_au)
    result = "#{ @name } is #{ distance_au } AU (or #{ distance_miles } million miles) from #{ something.name }!"
    return result
  end

  private

  #----------- UPDATE VALUES WHEN ASSIGNED TO PLANET
  def set_local_year(age) #!W when learn inheritance, can has master class
    year = age / @year

    if year / 1_000_000_000 > 1 # if large number of years, convert to billions
      year /= 1_000_000_000
      year = "#{ year.round(2) } billion"
    else
      year /= 1_000_000 # otherwise, millions are okay
      year = "#{ year.round(2) } million"
    end

    @local_year = "In local years, #{ @name } has existed for about #{ year } years."
  end

  def set_planet_name(name)
    @planet = name
  end
end

def update_day #!W when learn inheritance, can has master class
  if @day < 0
    @day *= -1
    @retrograde = true
  end
end


def update_sentience #!W when learn inheritance, can has master class
  if @sentience < 20_000
    @sentience = "not very bright"
  elsif @sentience < 100_000
    @sentience = "developing basic intelligence"
  elsif @sentience < 20_000_000
    @sentience = "having an IQ above that of a housecat, crow, or dog"
  else
    @sentience = "the smartest thing this side of the Hyades cluster"
  end
end

#---------------------------- end MOON CLASS SECTOR ----------------------------
#-------------------------- begin PLANET CLASS SECTOR --------------------------

class Planet
  attr_accessor :moons
  attr_reader :day, :distance, :exports, :local_year, :name, :sentience, :size,
    :star, :year

  def initialize(planet_hash)
    #----------- INITIALIZE BASE VALUES ----------
    @day                 = planet_hash[:day]
    @distance            = planet_hash[:distance]
    @exports             = planet_hash[:exports]
    @moons               = {}
    @name                = planet_hash[:name]
    @number              = planet_hash[:number]
    @sentience           = planet_hash[:sentience]
    @size                = planet_hash[:size]
    @symbol              = planet_hash[:symbol]
    @year                = planet_hash[:year]

    #----------- UPDATE INITIALIZED VALUES ----------
    update_day
    update_number
    update_sentience
  end

  #----------- DESCRIBERS ----------

  def describe
    puts "\tAt about #{ format_distance }, from good ol' #{ @star }"
    puts "(on average), #{ @name } is the #{ @number } planet from the sun. It has #{ format_moons }, and its closest"
    puts "neighbors often describe it as \"#{ @sentience }.\"\n\n"

    puts "\tFor every earth standard day, #{ @name } experiences #{ @day.round(3) } days, or #{ format_hours }"
    puts "earth hours. For every year that passes on earth, #{ @name } experiences #{ (1 / @year).round(3) }. That is,"
    puts "it rotates around #{ @star } every #{ format_months } earth months. Hmmm, that's #{ format_year }."
    puts "#{ @local_year }\n\n"

    puts "#{ describe_exports } \n"

    puts "That's all I can tell you right now!\n\n"

    return
  end


  def describe_exports #!W when learn inheritance, can has master class
    if @exports
      puts "\t#{ @name }'s primary exports are:"

      count = 1
      @exports.each do |export|
        puts "\t\t#{ count }. #{ export }"
        count += 1
      end

    else
      puts "\t#{ @name }'s exports are pretty much nonexistent at this point."
    end

    return
  end


  def describe_moons
    if @moons.length > 0
      puts "I have #{ format_moons } orbiting me:"

      count = 1
      @moons.each do |moon_symbol, moon_hash|
        puts "#{ count }. #{ moon_hash.name }"
        count += 1
      end

    else
      puts "There are no moons visibly orbiting me."
      puts "I might be lonely, or they might be too small for you to see."
    end

    return
  end


  def distance_from(something) #!W when learn inheritance, can has master class
    if something.distance > @distance
      distance_au = (something.distance - @distance).round(3)
    elsif something.distance < @distance
      distance_au = (@distance - something.distance).round(3)
    else
      return "Are you sure those are different objects?"
    end

    distance_miles = convert_au_to_miles(distance_au)
    result = "#{ @name } is #{ distance_au } AU (or #{ distance_miles } million miles) from #{ something.name }!"
    return result
  end


  def orbits(star_name)
    if star_name.class == Star
      star_name.planets[@symbol] = self
    else
      puts "Planets can only orbit stars."
    end

    set_local_year(star_name.age)
    set_star_name(star_name.name)
  end


  private

  def convert_au_to_miles(au) #!W when learn inheritance, can has master class
    miles = au * 93
    return miles
  end

#----------- UPDATE VALUES IMMEDIATELY
  def update_day #!W when learn inheritance, can has master class
    if @day < 0
      @day *= -1
      @retrograde = true
    end
  end


  def update_sentience #!W when learn inheritance, can has master class
    if @sentience < 20_000
      @sentience = "not very bright"
    elsif @sentience < 100_000
      @sentience = "developing basic intelligence"
    elsif @sentience < 20_000_000
      @sentience = "having an IQ above that of a housecat, crow, or dog"
    else
      @sentience = "the smartest thing this side of the Hyades cluster"
    end
  end


  def update_number
    if @number == 1
      @number = "#{ @number }st"
    elsif @number == 2
      @number = "#{ @number }nd"
    elsif @number == 3
      @number = "#{ @number }rd"
    else
      @number = "#{ @number }th"
    end
  end

  #----------- UPDATE VALUES WHEN ASSIGNED TO STAR
  def set_local_year(age)
    year = age / @year

    if year / 1_000_000_000 > 1 # if large number of years, convert to billions
      year /= 1_000_000_000
      year = "#{ year.round(2) } billion"
    else
      year /= 1_000_000 # otherwise, millions are okay
      year = "#{ year.round(2) } million"
    end

    @local_year = "In local years, #{ @name } has existed for about #{ year } years."
  end


  def set_star_name(name)
    @star = name
  end

  #----------- FORMAT DATA FOR DESCRIBERS
  def format_distance #!W when learn inheritance, can has master class
    au = @distance.round(3)
    miles = au * 93

    return "#{ au } astronomical units, or #{ miles } million miles"
  end


  def format_exports #!W when learn inheritance, can has master class
    if @exports
      output = ""
      count = 0
      last = @exports.length - 1

      if count != last # unless count == index of last item in array
        @exports.each do |export|
          if count == last
            output += "and #{ export }"
          else
            output += "#{ export }, "
          end
          count += 1
        end

      else # when count == index of last item in array
        output += @exports[count]
      end

      return output

    else
      return "pretty much nonexistent"
    end
  end


  def format_hours #!W when learn inheritance, can has master class
    hours = @day * 24
    return hours.round(3)
  end


  def format_months #!W when learn inheritance, can has master class
    return (@year * 12).round(3)
  end


  def format_moons #!W when learn inheritance, can has master class
    if @moons.length == 1
      return "#{ @moons.length } moon"
    else
      return "#{ @moons.length } moons"
    end
  end


  def format_retrograde #!W
    if @retrograde
      return "RETROGRADE FLAVOR TEXT"
    else
      return "BORING NOT RETROGRADE FLAVOR TEXT"
    end
  end

  def format_year #!W when learn inheritance, can has master class
    rando = [
      "pretty believable",
      "a little weird",
      "not too scary",
      "pretty interesting"
      ]
    return rando[rand * rando.length]
  end
end

#--------------------------- end PLANET CLASS SECTOR ---------------------------
#--------------------------- begin STAR CLASS SECTOR ---------------------------

class Star
  attr_reader :age, :day, :distance, :exports, :name, :sentience
  attr_accessor :planets


  def initialize(star_hash)
    @age       = star_hash[:age]
    @day       = star_hash[:day]
    @distance  = 0
    @exports   = star_hash[:exports]
    @name      = star_hash[:name]
    @planets   = {}
    @sentience = star_hash[:sentience]
    @symbol    = star_hash[:symbol]
  end


  def describe_planets
    if @planets.length > 0
      puts "There are #{ @planets.length } planets orbiting me:"

      count = 1
      @planets.each do |planet_symbol, planet|
        puts "#{ count }. #{ planet.name }"
        count += 1
      end

    else
      puts "There are no planets visibly orbiting me."
      puts "I might be lonely, or they might be too small for you to see."
    end

    return
  end
end

#---------------------------- end STAR CLASS SECTOR ----------------------------
#------------------------------- begin DATA SECTOR -----------------------------

def get_known_universe

  #------------SUN---------------
  sun_info = {
    age: 4_600_000_000, # 4.6 billion years
    day: 25.38, # earth days
    distance: 0, # center of the system
    exports: ["visible light", "sheer magnetism", "thermonuclear fusion"],
    name: "Sol",
    sentience: 27_013, # flavor text
    size: 109.3, # log? scale compared to earth, same for all objects
    symbol: :sun
  }

  sun = Star.new(sun_info)

  #-----------MERCURY-------------
  mercury_info = {
    day: 58.646,
    distance: 0.387, # 57mil km 35mil miles (.387AU)
    exports: ["hot", "cold"],
    name: "Mercury",
    number: 1,
    sentience: 4,
    size: 0.383,
    symbol: :mercury,
    year: 0.2408467 # (87.97 earth days)
  }

  mercury = Planet.new(mercury_info)
  mercury.orbits(sun)

  #-----------VENUS--------------
  venus_info = {
    day: -243.018, # retrograde
    distance: 0.722, # 108mil km, 67mil mi (.722 AU)
    name: "Venus",
    number: 2,
    sentience: 46_234_008,
    size: 0.95,
    symbol: :venus,
    year: 0.61519726
  }

  venus = Planet.new(venus_info)
  venus.orbits(sun)

  #-----------EARTH--------------
  earth_info = {
    day: 0.99726968,
    distance: 1, # 150mil km (93mil mi) (1AU)
    exports: ["garbage", "radio waves", "tiny machines that crash into stuff"],
    name: "Earth",
    number: 3,
    sentience: 3_649,
    size: 1.0,
    symbol: :earth,
    year: 1.0000174
  }

  earth = Planet.new(earth_info)
  earth.orbits(sun)

  moon_info = {
    day: 27.322,
    distance: 0.00256955436, # 384,400 km, 238,855mi
    exports: ["lunar regolith"],
    name: "Moon",
    number: 1,
    sentience: 673_158_431,
    size: 0.273,
    symbol: :moon,
    year: 0.074803559
  }

  moon = Moon.new(moon_info)
  moon.orbits(earth)

  #------------MARS--------------
  mars_info = {
    day: 1.026,
    distance: 1.52, # 228 mil km (142 mil mi, 1.52AU)
    name: "Mars",
    number: 4,
    sentience: 6_834,
    size: 0.532,
    symbol: :mars,
    year: 1.8808476
  }

  mars = Planet.new(mars_info)
  mars.orbits(sun)

  #----------JUPITER-------------
  jupiter_info = {
    day: 0.41354,
    distance: 5.20, # 779mil km, 484mil mi, 5.20AU
    exports: [
      "amazing cloud formations",
      "terrible storms",
      "sophisticated layering systems"
      ],
    name: "Jupiter",
    number: 5,
    sentience: 7_708_434,
    size: 10.97,
    symbol: :jupiter,
    year: 11.862615
  }

  jupiter = Planet.new(jupiter_info)
  jupiter.orbits(sun)

  io_info = {
    day: 1.769,
    distance: 0.00281822091, #AU, 421,600 km, 261,970 mi
    name: "Io",
    number: 1,
    sentience: 16_313,
    size: 0.286,
    symbol: :io,
    year: 0.004843258
  }

  io = Moon.new(io_info)
  io.orbits(jupiter)

  europa_info = {
    day: 3.551181041,
    distance: 0.00448469022, #AU, 670,900 km, 416,878mi
    name: "Europa",
    number: 2,
    sentience: 605_777,
    size: 0.245,
    symbol: :europa,
    year: 0.009722108
  }

  europa = Moon.new(europa_info)
  europa.orbits(jupiter)

  ganymede_info = {
    day: 7.15455296,
    distance: 0.00704760702, #AU, 1,070,400 km, 655,116 mi
    name: "Ganymede",
    number: 3,
    sentience: 1_820,
    size: 0.413,
    symbol: :ganymede,
    year: 0.019589322
  }

  ganymede = Moon.new(ganymede_info)
  ganymede.orbits(jupiter)

  callisto_info = {
    day: 16.6890184,
    distance: 0.0125850771, #AU, 1,882,700 km, 1,169,856 mi
    name: "Callisto",
    number: 4,
    sentience: 239,
    size: 0.378,
    symbol: :callisto,
    year: 0.04569473
  }

  callisto = Moon.new(callisto_info)
  callisto.orbits(jupiter)

  #-----------SATURN-------------
  saturn_info = {
    day: 0.444,
    distance: 9.58, # 1.43bil km, 889mil mi, 9.58AU
    name: "Saturn",
    number: 6,
    sentience: 22_452,
    size: 9.14,
    symbol: :saturn,
    year: 29.447498
  }

  saturn = Planet.new(saturn_info)
  saturn.orbits(sun)

  titan_info = {
    day: 15.95,
    distance: 0.00816742947, # 1,221,830 km, 759,210mi
    name: "Titan",
    number: 6,
    sentience: 50_075,
    size: 0.404,
    symbol: :titan,
    year: 0.4366872
  }

  titan = Moon.new(titan_info)
  titan.orbits(saturn)

  #-----------URANUS-------------
  uranus_info = {
    day: -0.718, # retrograde!
    distance:  19.2, # 2.88bilkm, 1.79bil mi, 19.2AU
    exports: ["inappropriate jokes"],
    name: "Uranus",
    number: 7,
    sentience: 2,
    size: 1.0,
    symbol: :uranus,
    year: 84.016846
  }

  uranus = Planet.new(uranus_info)
  uranus.orbits(sun)

  #-----------NEPTUNE------------
  neptune_info = {
    day: 0.671,
    distance: 30.1, # 4.5bil km, 2.8bil mi, 30.1AU
    name: "Neptune",
    number: 8,
    sentience: 2_198,
    size: 1.0,
    symbol: :neptune,
    year: 164.79132
  }

  neptune = Planet.new(neptune_info)
  neptune.orbits(sun)

  triton_info = {
    day: 5.877,
    distance: 0.00237142796, #354,760km, 220438mi,
    name: "Triton",
    number: 1,
    sentience: 142,
    size: 0.212,
    symbol: :triton,
    year: 0.016090349
  }

  triton = Moon.new(triton_info)
  triton.orbits(neptune)

  #------------PLUTO-------------
  pluto_info = {
    day: -6.387, # retrograde!
    distance: 39.5, # 5.91bil  km, 3.67bil mi, 39.5 AU
    name: "Pluto",
    number: 9,
    sentience: 1_724_013,
    size: 0.185,
    symbol: :pluto,
    year: 247.9206
  }

  pluto = Planet.new(pluto_info)
  pluto.orbits(sun)

  return sun
end

#------------------------------- end DATA SECTOR -------------------------------
#-------------------------- begin USER INPUT SECTOR ----------------------------

def get_user_input(question)
  puts question
  user_input = $stdin.gets.chomp
  user_input.downcase!

  if (user_input.include? "quit") || (user_input.include? "exit")
    exit
  end

  return user_input
end

#--------------------------- end USER INPUT SECTOR -----------------------------
#------------------- begin VALIDATION / CONFIRMATION SECTOR --------------------

def verify_user_confirmation(question)
  user_confirmation = get_user_input(question)

  if user_confirmation.include? "n"
    return false
  elsif user_confirmation.include? "y"
    return true
  else
    possible_responses = [true, false]
    random_choice = (rand * 2).floor
    return possible_responses[random_choice]
  end
end


def check_triggers(triggers, check_here)
  triggers.each do |trigger|
    if check_here.include? trigger
      return true
    else
      return false
    end
  end
end

#-------------------- end VALIDATION / CONFIRMATION SECTOR ---------------------
#---------------------- begin INTERACT WITH DATA SECTOR ------------------------

def select_planet
  universe = get_known_universe

  # these should be an attribute of their objects, eh? !W
  mercury = {
    planet: :mercury,
    triggers: %w{merc 1 first one}
  }

  venus = {
    planet: :venus,
    triggers: %w{ven 2 second two}
  }

  earth = {
    planet: :earth,
    triggers: %w{eart 3 third three}
  }

  mars = {
    planet: :mars,
    triggers: %w{mars 4 four forth}
  }

  jupiter = {
    planet: :jupiter,
    triggers: %w{jupi 5 fifth fiv}
  }

  saturn = {
    planet: :saturn,
    triggers: %w{satur 6 six}
  }

  uranus = {
    planet: :uranus,
    triggers: %w{uran 7 seven}
  }

  neptune = {
    planet: :neptune,
    triggers: %w{nept 8 eight}
  }

  pluto = {
    planet: :pluto,
    triggers: %w{plut 9 ninth nine dwarf}
  }

  planets_here = [mercury, venus, earth, mars, jupiter, saturn, uranus, neptune, pluto]

  puts "\nAvailable planets:"
  puts "Mercury, Venus, Earth, Mars, Jupiter, Uranus, Neptune, and Pluto."

  user_input = get_user_input("What planet would you like to know more about?")

  planets_here.each do |planet_here|
    if check_triggers(planet_here[:triggers], user_input)
      puts "Great! You want to know more about #{ user_input }.\n\n"
      return universe.planets[planet_here[:planet]].describe
    end
  end

  puts "I didn't understand that."

  return
end


def query_universe
  select_planet

  if verify_user_confirmation("Would you like to know something else?")
    return query_universe
  else
    puts "Okay. It was nice chatting with you about the solar system. Goodbye!"
    return
  end
end

#----------------------- end INTERACT WITH DATA SECTOR -------------------------
#--------------------- recommended setup for irb/pry/etc -----------------------

# I recommend setting up like this:

# # star
# sun = get_known_universe

# # planets
# mercury = sun.planets[:mercury]
# venus = sun.planets[:venus]
# earth = sun.planets[:earth]
# mars = sun.planets[:mars]
# jupiter = sun.planets[:jupiter]
# saturn = sun.planets[:saturn]
# uranus = sun.planets[:uranus]
# neptune = sun.planets[:neptune]
# pluto = sun.planets[:pluto]

# # moons
# moon = earth.moons[:moon]
# callisto = jupiter.moons[:callisto]
# europa = jupiter.moons[:europa]
# ganymede = jupiter.moons[:ganymede]
# io = jupiter.moons[:io]
# titan = saturn.moons[:titan]
# triton = neptune.moons[:triton]

# things worth trying:
#   - sun.describe_planets
#   - sun.exports
#   - jupiter.describe_moons
#   - neptune.distance_from(pluto)
#   - pluto.distance_from(jupiter)
#   - earth.exports
#   - mars.describe
#   - mercury.sentience

# I made pretty much everything readable, so you can check out all the data.

#---------------------- FINALLY, CALL QUERY_SOLAR_SYSTEM! ----------------------

query_universe # comment this out if you're playing in irb/pry/etc
