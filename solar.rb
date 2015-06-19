# Brandi Wilson - PLANETARY SOLAR SYSTEM (BREAKFAST)

# Ideally, I would have used a combination of arrays and hashes,
# but I wanted to practice using hashes--espcially hashes in hashes.
# Needed to wrap my head around that concept.

# CREATES A PLANET OBJECT
class Planet
  attr_accessor :name, :moons, :rings, :type, :day_length, :year_length, :life

  # creates planet object
  def initialize(planet_hash)
    @name =  planet_hash[:name]   # string
    @moons = planet_hash[:moons]   # int
    @rings = planet_hash[:rings]   # true or false
    @type =  planet_hash[:type]   # string: terrestrial, gas giant, dwarf
    @day_length = planet_hash[:day_length]   # int/float: length of day in Earth hours
    @year_length = planet_hash[:year_length]   # int/float: length of orbit in Earth years
    @life = planet_hash[:life]   # true or false
  end # end of initialize

  # prints a readable list of all planet info
  def print_info
    puts """
    Name:        #{@name.to_s}
    Moons:       #{@moons.to_s}
    Rings:       #{@rings.to_s}
    Type:        #{@type.to_s}
    Day Length:  #{@day_length.to_s}
    Year Length: #{@year_length.to_s}
    Life:        #{@life.to_s}
    """
  end # end of print_info

end # end of Planet class


# CREATES A NEW SOLAR SYSTEM
class SolarSystem
  attr_accessor :planet_list

  # you can pass in your own pre-made solar system (needs a hash in a hash)
  # ex. planets_variable = {:earth=>{:name=>"Earth", :moons=>1, :life=>true}, :mars=>{:name=>"Mars", :moons=>2, :life=>false}}
  # or you can auto make an empty solar system if no parameter
  def initialize(planets_hash = {})   # need to pass in a hash listing planet names as the keys and hashes with planet info as the values
    @planet_list = {}
    planets_hash.each_key do |planet_key|   # for each key inside the hash (that was given to the initializer)...
      @planet_list[planet_key] = Planet.new(planets_hash[planet_key])   #...adds the key as a key in the instance hash AND assigns that key a new Planet object using the hashes inside the hash given to the initializer
    end

    if @planet_list.length >= 1    # announcements
      puts "BAM! YOUR SOLAR SYSTEM IS BORN!"
    else
      puts "WELCOME TO YOUR EMPTY SOLAR SYSTEM!"
    end
  end # end of initialize

  # adds a planet (hash) to the solar system
  def add_planet(planet_hash)
    @planet_list[planet_hash[:name].to_sym] = Planet.new(planet_hash)
    puts "Welcome to the solar world, #{planet_hash[:name].to_s}!"
  end

  # removes a planet (hash) from the solar system
  def sub_planet(planet_name)
    @planet_list.delete(planet_name.to_sym)
    puts "#{planet_name} has been sent to the void!"
  end

  # lists planets one line at a time
  def list_planets
    puts "List of Planets:"
    @planet_list.each_key do |planet_key|
      puts planet_key.to_s.capitalize
    end
  end # end of list_planets

  # gives the planet info for a specific planet
  def planet_info(planet_name)
    @planet_list[planet_name.to_sym].print_info
  end # end of readable_info

  # creates the Ada planet in the solar system
  def add_planet_ada
      ada_planet_hash = {
        name: "Ada",
        moons: 2,
        rings: true,
        type: "terrestrial",
        day_length: "way too long",
        year_length: 1,
        life: true,
      }
      @planet_list[:Ada] = Planet.new(ada_planet_hash)
      puts "Congrats, you have added the Ada planet!"
  end # end of add_planet_ada

end # end of SolarSystem class

# in command line type "irb -r ./solar.rb" to use
