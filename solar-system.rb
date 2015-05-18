# Solar System Project

require "colorize"

class Planet
	# allow attributes to be accessed
	attr_accessor 	:name, :radius_in_miles, :mass_in_earth_mass, :moons, \
					:rotation_rate, :solar_system, :chief_export, :distance_from_the_sun

	# initialize new instance of Planet with hash
	def initialize(planet_hash)
		@name 					= planet_hash[:name]
		@radius_in_miles 		= planet_hash[:radius_in_miles]
		@mass_in_earth_mass		= planet_hash[:mass_in_earth_mass]
		@moons					= planet_hash[:moons]
		@rotation_rate 			= planet_hash[:rotation_rate]
		@solar_system 			= planet_hash[:solar_system]
		@chief_export 			= planet_hash[:chief_export]
		@distance_from_the_sun	= planet_hash[:distance_from_the_sun]
	end

	def local_year
		current_year = Time.now.year
		age_in_earth_years = current_year - @solar_system.formation_year
		# puts "age in earth years is: #{age_in_earth_years}"
		@local_year = ( age_in_earth_years * @rotation_rate ).ceil
		puts "The local year on #{@name} is #{@local_year}."
	end

	def distance_away(other_planet)
		if @distance_from_the_sun && other_planet.distance_from_the_sun
			@distance_away = ( @distance_from_the_sun - other_planet.distance_from_the_sun ).abs
			return @distance_away
		else
			puts "There isn't enough information to determine the distance between #{ self.name } \
			and #{ other_planet.name }."
		end
	end
end

class SolarSystem
	attr_accessor :planets, :formation_year

	def initialize(solar_system_hash)
		if solar_system_hash[:planets]
			@planets = solar_system_hash[:planets]
			solar_system_hash[:planets].each do |planet|
				planet.solar_system = self
			end
		# initialize with empty array if no planets are passed in
		else
			@planets = [ ]
		end
		@formation_year = solar_system_hash[:formation_year]
	end

	def planets_list
		list = ""
		index = 1

		@planets.each do |planet|
			list << "#{ index }. #{ planet.name }, "
			index += 1
		end

		# print list minus final extra ", "
		@planets_list = list[0..-3]
	end

	def add_planet(new_planet)
		if new_planet.class == Planet
			@planets.push(new_planet)
			new_planet.solar_system = self
		else
			puts "#{ new_planet } is not a valid planet. Please try again."
		end
	end

	def planet_count
		@planet_count = @planets.length
		puts "This solar system has #{ @planet_count } planets."
	end
end

def show_data(choice_of_planet)
	line_width = 40
	puts "\n"
	# uses colorize gem to add red to text of Planet.name
	puts choice_of_planet.name.center(line_width).red
	# adds cyan color to dashed line
	puts ("-" * line_width).cyan
	puts "radius (miles):".ljust( line_width/2 ) + "#{ choice_of_planet.radius_in_miles }".rjust( line_width/2 )
	puts "mass (Earth mass):".ljust( line_width/2 ) + "#{ choice_of_planet.mass_in_earth_mass }".rjust( line_width/2 )
	puts "chief exports:".ljust( line_width/2 ) + "#{ choice_of_planet.chief_export }".rjust( line_width/2 )
	puts "\n"
end

def show_planet(query_system)
	# use while loop with keep_going boolean
	@keep_going = true
	while @keep_going == true
		puts "Please select a planet to learn about: (enter STOP to exit)"
		puts "\n"
		
		puts query_system.planets_list
		puts "\n"

		@selection = gets.chomp.downcase

		case @selection
		when "gaia", "1"
			show_data( query_system.planets[0] )
		when "mars", "2"
			show_data( query_system.planets[1] )
		when "pluto", "3"
			show_data( query_system.planets[2] )
		when "jupiter", "4"
			show_data( query_system.planets[3] )
		when "saturn", "5"
			show_data( query_system.planets[4] )
		when "stop", "exit"
			puts "Goodbye."
			@keep_going = false
		else
			puts "\n--> That selection is not valid."
			puts "\n"
		end
	end
end

def test_query
	@test_system = SolarSystem.new( planets: [
		Planet.new(	name: "Gaia",
					radius_in_miles: 7918,
					mass_in_earth_mass: 1,
					moons: 1,
					chief_export: "pollution" ),
		Planet.new(	name: "Mars",
					radius_in_miles: 2106,
					mass_in_earth_mass: 0.107,
					moons: 2,
					chief_export: "aliens" ),
		Planet.new(	name: "Pluto",
					radius_in_miles: 1430,
					mass_in_earth_mass: 0.00218,
					moons: 5,
					chief_export: "sadness" ),
		Planet.new(	name: "Jupiter",
					radius_in_miles: 43441,
					mass_in_earth_mass: 317.8,
					moons: 67,
					chief_export: "gas" ),
		Planet.new(	name: "Saturn",
					radius_in_miles: 36184,
					mass_in_earth_mass: 95.16,
					moons: 62,
					chief_export: "rings" ) ] )

	show_planet( @test_system )
end
