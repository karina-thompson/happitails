class Shelter

  attr_reader :animals, :clients

  def initialize
    @animals = []
    @clients = []
  end

  def display_animals
    puts "Current animal residents at Happitails:"
    @animals.each do |animal|
      puts "#{animal.name}, #{animal.age} year old #{animal.gender} #{animal.species}"
    end
  end

  def display_clients
    puts "Client list:"
    @clients.each do |client|
      puts "#{client.name}, #{client.age} years old, has #{client.num_of_children} children and #{client.num_of_pets} pets"
    end
  end

  def add_animal(animal)
    @animals << animal
  end

  def add_client(client)
    @clients << client
  end

  def remove_animal(animal)
    @animals.delete(animal)
  end

  def adopt(client, animal)
    client.add_pet(animal)
    remove_animal(animal)
  end

  def surrender(client, animal)
    client.remove_pet(animal)
    add_animal(animal)
  end

end

