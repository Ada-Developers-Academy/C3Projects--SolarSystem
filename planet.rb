class Planet
  attr_accessor :planet_hash, :name, :diameter, :mass, :moons, :water

def initialize(planet_hash = {})
    
    @name = planet_hash[:name]
    @diameter = planet_hash[:diameter]
    @mass = planet_hash[:mass]
    @moons = planet_hash[:moons]
    @water = planet_hash[:water]
  end
end

class SolarSystem
  attr_accessor :planets 

    def initialize(planets = 0)
      puts planets
      planet_array = []
      planets.times do |p|
        planet_instance = Planet.new
        planet_array.push(planet_instance)
      end
      @planets = planet_array
    end
#Each method adds/changes an attribute to the chosen planet. The default is the first planet.
#Example: solar_system.new_moons(6, 1)
    def new_name(n_name, index = 0)
      @planets[index].name = n_name
    end

    def new_diameter(n_diameter, index = 0)
      @planets[index].diameter = n_diameter
    end

    def new_mass(n_mass, index = 0)
      @planets[index].mass = n_mass
    end

    def new_moons(n_moons, index = 0)
      @planets[index].moons = n_moons
    end

    def new_water(n_water, index = 0)
      @planets[index].water = n_water
    end
#Another way to change/add the attributes by calling just one method. 
#Example solar_system.change({water: true, name: "blue", diameter: 5000000000}, 3)
    def change(c_hash = {}, index = 0)
      @planets[index].water = c_hash[:water]
      @planets[index].name = c_hash[:name]
      @planets[index].diameter = c_hash[:diameter]
      @planets[index].mass = c_hash[:mass]
      @planets[index].moons = c_hash[:moons]
    end
end

