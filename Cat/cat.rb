# Exercise 2: The Cat's Meow
class Cat
  attr_accessor :name, :preferred_food, :meal_time
  # Every cat should have three attributes when they're created:
  # name, preferred_food and meal_time
  def initialize(name, preferred_food, meal_time)
    @name = name
    @preferred_food = preferred_food
    @meal_time = meal_time
  end

  # def name
  #   @name
  # end

  # Add an instance method called eats_at that returns the hour of the day
  # with AM or PM that this cat eats.
  def eats_at
    if @meal_time > 12
      "#{ @meal_time - 12 } PM"
    else
      "#{ @meal_time} AM"
    end
  end

  # Add another instance method called meow that
  # returns a string of the cat telling you all about itself
  # The return value should be something like "My name is Sparkles and I eat tuna at 11 AM"
  def meow
    "My name is #{@name} and I eat #{@preferred_food} at #{eats_at}"
  end

end

# Create two instances of the Cat class in your file
fred = Cat.new("Fred", "Fish", 18)
todd = Cat.new("Todd", "Salmon", 10)

puts fred.eats_at
puts fred.meow

puts todd.meow
