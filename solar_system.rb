# PLANET CLASS ---------------------------------------------------->
class Planet

	attr_accessor :name, :moons, :color, :life, :beings, :galactus_ate_it, :rate_solar_rotation

	def initialize(planet_hash)
		@name = planet_hash[:name]
		@moons = planet_hash[:moons]
		@color = planet_hash[:color]
		@life = planet_hash[:life]
		@beings = planet_hash[:beings]
		@galactus_ate_it = planet_hash[:galactus_ate_it]
		@rate_solar_rotation = planet_hash[:rate_of_solar_rotation]
	end

end


# SOLAR SYSTEM CLASS ---------------------------------------------->
class SolarSystem

	attr_reader :formation_year
	attr_accessor :planets, :solar_system

	def initialize
		@formation_year = 2000
		@solar_system = []
		@planets = [{ name: "Ada", moons: 2, color: "Cerulean", life: true, beings: "Adies", galactus_ate_it: false, rate_solar_rotation: 1 }, 
								{ name: "Jeri", moons: 1, color: "Cinnamon Roll", life: true, beings: "Robot Mongoloids", galactus_ate_it: false, rate_solar_rotation: 29 },
								{ name: "Brandi", moons: 2.5, color: "Sparkly Purple", life: false, beings: nil, galactus_ate_it: false, rate_solar_rotation: 19 },
								{ name: "Pants", moons: 5, color: "Denim", life: false, beings: nil, galactus_ate_it: true, rate_solar_rotation: 13 }]
	end
 
 # Adds @planets into solar system
 	def add_planets
	 	planets.each do |planet|
			@solar_system.push(Planet.new(planet))
		end
	end

end