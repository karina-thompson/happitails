

class Client

  attr_accessor :name, :num_of_children,:age, :num_of_pets, :adopted_pets
  
  def initialize(name, num_of_children, age, num_of_pets) 
    @name = name
    @num_of_children = num_of_children
    @age = age
    @num_of_pets = num_of_pets
    @adopted_pets = []
  end

  def add_pet(animal)
    @adopted_pets << animal
    @num_of_pets += 1
  end

  def remove_pet(animal)
    @adopted_pets.delete(animal)
    @num_of_pets -= 1
  end

  def find_pet(animal_name)
    @adopted_pets.find { |animal| animal.name == animal_name }
  end
end
