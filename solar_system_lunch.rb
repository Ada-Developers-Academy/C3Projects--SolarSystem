# Planet Class

#works through lunch
#maybe explore dinner

require "awesome_print" 

class Planet
	attr_reader :name
	attr_accessor :rotation

	# create planet attributes 

	def initialize (planet_attributes)
		@name = planet_attributes[:name]
		@diameter = planet_attributes[:diameter]
		@mass = planet_attributes[:mass]
		@moons = planet_attributes[:moons]
		@life = planet_attributes[:life]
		@rotation = planet_attributes[:rotation]
		ap planet_attributes
	end

end

###################################################

# SolarSystem Class
require "colorize"

class SolarSystem
	attr_reader :planets, :number_planets, :local_year, :gallifrey, :xander # allows access to planets in solar system array
	attr_accessor :name, :new_planet # allows addition of new planets via user input
	
	
	def initialize
		@planets = [gallifrey, xander] # initialize hard coded planets
		#@planets.push(@new_planet) # adds new planets via user input to planets array
		@number_planets = @planets.length #counts planets by counting array elements
		@formation_year = rand(-3000000..2015)
		@age_of_system = 2015 - @formation_year
			
	end

	def gallifrey 
		gallifrey = Planet.new(name: "Gallifrey", diameter: 2, mass: 200, moons: 1, life: true, rotation: 4)

	end

	def xander
		xander = Planet.new(name: "Xander", diameter: 3, mass: 400, moons: 4, life: true, rotation: 10)
	end

	def formation_year
		if @formation_year < 0
			puts "This solar system formed in #{@formation_year.abs} BC".colorize(:blue) 
		elsif @formation_year >= 0
			puts "This solar system formed in #{@formation_year} AD"
		end
	end

	def local_year	
		@planets.each do |planet|
			local_year = @age_of_system / planet.rotation.to_i
			puts ""
			puts "The local year in #{planet.name} is #{local_year} years".colorize(:red)
			puts ""
		end
	end

	# optional user input section, can be expanded to condiational loops for all planet info
	def add_planet
		puts "Would you like to add a planet? Enter Y/N".colorize(:blue)
		answer = gets.chomp.downcase
		if answer == "y"
			puts "Great! Please enter the name of planet."
			name = gets.chomp
			puts "Now enter the diameter of your planet."
			diameter = gets.chomp
			puts "What is the mass of your new planet?"
			mass = gets.chomp
			puts "How many moons?"
			moons = gets.chomp
			puts "Is there life on your planet? Please enter \"Y\" or \"N\"."
			life = gets.chomp.downcase
				if life == "y"
					life = true
				else 
					life = false
				end
			puts "Finally, what is the solar rotation of your planet?"
			rotation = gets.chomp
			@new_planet = Planet.new(name: name, diameter: diameter, mass: mass, moons: moons, life: life, rotation: rotation)
			@planets.push(new_planet)
			puts "Great! #{name} is born!".colorize(:blue)
		else
			puts "Fine. I didn't want your planets anyway.".colorize(:blue)
		end
	end
end
 


