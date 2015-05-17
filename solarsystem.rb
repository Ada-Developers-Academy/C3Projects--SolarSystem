# Solar System Project

class Planet

        attr_accessor :name, :diameter, :mass, :moons, :aliens, :rotation_speed, :planet_age

        def initialize(planet_hash)
                @name = planet_hash[:name]
                @diameter = planet_hash[:diameter]
                @mass = planet_hash[:mass]
                @moons = planet_hash[:moons]
                @aliens = planet_hash[:aliens]
                @rotation_speed = planet_hash[:rotation_speed]
                @planet_age = planet_hash[:planet_age]
        end

end


class SolarSystem

        attr_accessor :creation_year, :solarsystem, :solarsystem_age

        def initialize
                @solarsystem = []
                @creation_year = rand(2015) # random year between 0 and 2015
                @solarsystem_age = 2015 - @creation_year.to_i 

        end

        def create_planet(planet_attr) # drop in keys and values when creating new planet
                @planet_attr = planet_attr
                @new_planet = Planet.new(planet_attr)

                if @new_planet.rotation_speed == nil # i.e. rotation speed is not specified
                        @new_planet.rotation_speed = rand(0..1.0) # use this default: random # of rotations per year
                end

                @new_planet.planet_age = @solarsystem_age * @new_planet.rotation_speed
        #Ex:     10 years                                20 years                  0.5 rotations per yr

                @solarsystem.push(@new_planet) # add new planet to solar system

                puts @new_planet.rotation_speed # show rotation speed for reference
                puts @new_planet.planet_age     # show planet age for reference
                puts @solarsystem                               # show array of planets so far for reference
        end

        def count_planets
                puts @solarsystem.length        # counts num of planets in the array
        end 

        def local_year(planet_index) # select which planet in the solar system you want to check the local year for by index num
                planet_age = @solarsystem[planet_index].planet_age
                puts 2015 - planet_age.to_i # to calculate year it was created
        end


end
