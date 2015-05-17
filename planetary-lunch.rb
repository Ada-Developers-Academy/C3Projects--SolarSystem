class Planet
  attr_reader :name, :mass, :moons
  def initialize(planet_hash)
    @name = planet_hash[:name]
    @mass = planet_hash[:mass]
    @moons = planet_hash[:moons]
  end
end

Planet.new(name: "Saturn", mass: "568 kg", moons: "8")
Planet.new(name: "Zoltran", mass: "234 kg", moons: "1")
Planet.new(name: "Lifeless", mass: "143 kg", moons: "0")
Planet.new(name: "Abductionprone", mass: "668 kg", moons: "4")

class SolarSystem
  attr_reader :planet, :age
    def initialize()
      @planet = [a, b, c, d ]
      @age = [x]
    end

def a
  a = Planet.new(name: "Saturn", mass: "568 kg", moons: "8")
end

def b
  b = Planet.new(name: "Zoltran", mass: "234 kg", moons: "1")
end

def c
  c = Planet.new(name: "Lifeless", mass: "143 kg", moons: "0")
end

def d
  d = Planet.new(name: "Abductionprone", mass: "668 kg", moons: "4")
end

def x
  x = SolarSystem.new(age:"900 Million Years")
end
end
