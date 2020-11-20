require 'pry'

class Owner

  attr_reader :name, :species

  @@all = []

  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
  end

  def say_species
    "I am a #{@species}."
  end

  def self.all
    @@all
  end

  def self.count
    @@all.length
  end

  def self.reset_all
    @@all.clear
  end

  def cats
    Cat.all.select do | cat |
      if cat.owner == self
        cat
      end
    end
  end

  def dogs
    Dog.all.select do | dog |
      if dog.owner == self
        dog
      end
    end
  end

  def buy_cat(cat_name)
    Cat.new(cat_name, self)
  end

  def buy_dog(dog_name)
    Dog.new(dog_name, self)
  end

  def walk_dogs
    dogs.map do | dog |
      dog.mood = "happy"
    end
  end

  def feed_cats
    cats.map do | cat |
      cat.mood = "happy"
    end
  end

  def sell_pets
    dogs.map do | dog |
      #binding.pry
      dog.mood = "nervous"
      dog.owner = nil
    end
    cats.map do | cat |
      cat.mood = "nervous"
      cat.owner = nil
    end
  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end

end

#binding.pry
0