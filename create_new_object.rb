module Logging
  def make_noise
    puts "start make_noise"
    super
    puts "end make_noise"
  end
end

class Bird
  extend Logging
  #def self.new(*arguments, &block)
    #instance = super
    #instance.singleton_class.include(Logging)
    #instance
  #end

  def make_noise
    puts "Chirp, chirp"
  end
end

class Duck < Bird
  prepend Logging

  def make_noise
    puts "Quack,,,Quack"
  end
end

bird = Bird.new
bird.singleton_class.include(Logging)
#p bird.make_noise

p Duck.new.make_noise
#p duck.make_noise

