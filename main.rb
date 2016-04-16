require 'pry'
require './client'
require './animal'
require './shelter'


def toys_to_add
  toy = nil
  toys = []
  until toy == 'done'
    puts "Any toys?: (Please enter the toy or 'done' if you have entered all toys)"
    toy = gets.chomp.downcase
    toys << toy unless toy == 'done'
  end
  toys
end


def get_animal_info
  puts 'Add a new animal'
  puts 'Name: '
  name = gets.chomp

  puts 'Age: '
  age = gets.chomp

  puts 'Gender: '
  gender = gets.chomp

  puts 'Species: '
  species = gets.chomp
  
  Animal.new(name, age, gender, species, toys_to_add)
end


def get_client_info
  puts 'Add a new client'
  puts 'Name: '
  name = gets.chomp

  puts 'Number of children: '
  num_of_children = gets.chomp

  puts 'Age: '
  age = gets.chomp

  puts 'Number of pets: '
  num_of_pets = gets.chomp

  Client.new(name,num_of_children,age,num_of_pets)
end


def find_client(shelter)
  puts "Name of client: "
  client_name = gets.chomp

  shelter.clients.find { |client| client.name == client_name }
end


def find_animal(shelter)
  puts "Name of animal: "
  animal_name = gets.chomp

  shelter.animals.find { |animal| animal.name == animal_name }
end


def adopt_animal(shelter)
  puts "Animal Adoption"
  client = find_client(shelter)
  animal = find_animal(shelter)
  shelter.adopt(client, animal)

  puts "#{client.name} has now adopted #{animal.name}"

end

def surrender_animal(shelter)
  puts "Animal surrender"
  client = find_client(shelter)
  puts "Name of animal: "
  animal_name = gets.chomp

  animal = client.find_pet(animal_name)
  shelter.surrender(client,animal)
end



my_shelter = Shelter.new

my_shelter.add_client(Client.new('Jane',3,45,1))
my_shelter.add_client(Client.new('Ben',1,30,1))
my_shelter.add_client(Client.new('Sarah',0,25,1))
my_shelter.add_animal(Animal.new('Barnabas', 5, 'male', 'cat', ['ball']))
my_shelter.add_animal(Animal.new('Marlee', 3, 'female', 'dog', ['rope']))


puts "Welcome to the Happitails Animal Shelter Management System"

puts "Please select from the following options:"
puts "Display all animals: press 1"
puts "Dislay all clients: press 2"
puts "Add a new client: press 3"
puts "Add a new animal: press 4"
puts "Animal adoption: press 5"
puts "Animal put up for adoption: press 6"

option = gets.chomp.downcase

until option == 'quit'
  
  case option

    when '1'
      my_shelter.display_animals

    when '2'
      my_shelter.display_clients    

    when '3'
      my_shelter.add_client(get_client_info)

    when'4'
      my_shelter.add_animal(get_animal_info)     

    when '5'
      adopt_animal(my_shelter)

    when '6'
      surrender_animal(my_shelter)
    end
  
  puts "Would you like to perform another task? Please select the option number, or type 'quit' to exit"
  option = gets.chomp.downcase

end
  


binding.pry

