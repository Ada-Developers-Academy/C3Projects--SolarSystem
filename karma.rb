# class Planet

# 	def initialize (planet_hash)
# 		@name = planet_hash[:name]
# 		@size = planet_hash[:size]
# 		@moons = planet_hash[:moons]
# 		@inhabitable = planet_hash[:inhabitable]
# 		@orbit = planet_hash[:orbit]
# 	end
# end

# Planet.new(name: "Troi", size: "80" , moons: "3", inhabitable: "false", orbit: "5" )
# Planet.new(name: "Guinan", size: "120" , moons: "5", inhabitable: "true", orbit: "0" )
# Planet.new(name: "Starbuck", size: "35" , moons: "0", inhabitable: "false", orbit: "10" )
# Planet.new(name: "Zoe", size: "95" , moons: "1", inhabitable: "true", orbit: "2" )
# Planet.new(name: "Janeway", size: "40" , moons: "2", inhabitable: "false", orbit: "5" )
# Planet.new(name: "Uhuru", size: "60" , moons: "9", inhabitable: "true", orbit: "1" )
# Planet.new(name: "River", size: "15" , moons: "1", inhabitable: "false", orbit: "2" )


# planet_array = [
# Planet.new(name: "Troi", size: "80" , moons: "3", inhabitable: "false", orbit: "5" ),
# Planet.new(name: "Guinan", size: "120" , moons: "5", inhabitable: "true", orbit: "0"),
# Planet.new(name: "Starbuck", size: "35" , moons: "0", inhabitable: "false", orbit: "10"),
# Planet.new(name: "Zoe", size: "95" , moons: "1", inhabitable: "true", orbit: "2" ),
# Planet.new(name: "Janeway", size: "40" , moons: "2", inhabitable: "false", orbit: "5" ),
# Planet.new(name: "Uhuru", size: "60" , moons: "9", inhabitable: "true", orbit: "1" ),
# Planet.new(name: "River", size: "15" , moons: "1", inhabitable: "false", orbit: "2" )

#  ] 

# class SolarSystem
	
# 	def initialize(planet_array)
# 		@planet_array = planet_array
# 	end	
# end	
	
class SolarSystem

	def initialize(planet_hash) 
		@name = planet_hash[:name]
		@discovered_by = planet_hash[:explorer]
		@inhabitable = planet_hash[:inhabitable]
		@moons = planet_hash[:moons]
		@spin = planet_hash[:spin] 	
	end

	:name = ["Troi","Starbuck","Guinan","Janeway","Uhuru","River","Zoe"]
	:explorer = [false, true, false, false, false, true, true]
	:inhabitable = []
	:moons = [3, 5, 0, 1, 2, 9, 1]
	:spin = ["clock","counter","clock","no","clock","counter","clock"]

	def basic_profile
		puts there are 
		puts "Which planet would you like to know more about?"
		puts "#{:name}"
		request = gets.chomp.capitalize
			if request = [:name]
				puts planet_hash()
			end
	end


end

# This entire exercise is a "bust" and needs to be redone. Every attempt to rewrite it indicates
# to me that I'm still unsure about the basic principles of creating a class. I have some of 
# the muscles memory but I don't KNOW what I'm doing.  For this last attempt I started with
# a script of what I wanted, with the intention of working backwards toward it.

# Class SolarSystem equals a hash of planets
 # - Karma = SolarSystem.new("Karma")
 # - some have moons
 # - some spin "clock"wise on their axis, others "counter" clockwise, some have "no"
 # - some are inhabitable, others not.
 # - 		formula for inhabitable: if less than 3 moons && clockwise spin = inhabitable
 # -		(should equal Troi, Guinan, Uhuru, and Zoe.) 
 # 			if moons <= 3 && spin == "clock"
 # 				inhabitable.push("is")
 # 			else
 # 				inhabitable.push("is not")
 # 			end

 # - some were discovered by members of the Federation of Planets(false), others were not (true)
 # - establish a basic profile "call" that puts info together by planet
 # -  	puts "Which planet do you want to know about?"
 # -			answer = gets.chomp
 # - 		puts "#{name} is #{position in planet_hash} of 7 planets in the Solar System Karma."
 # -		puts "It has #{moons} moons."
 # - 		puts "It spins #{spin} and #{inhabitable} inhabitable."




	




