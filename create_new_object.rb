module Logging
  def make_noise
    puts "start make_noise"
    super
    puts "end make_noise"
  end
end

module Notify
  def make_noise
    puts "start notify"
    super
    puts "end notify"
  end
end

class Bird
  prepend Notify
  prepend Logging
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
  # prepend Notify
  # prepend Logging

  def make_noise
    puts "Quack,,,Quack"
  end
end

# bird = Bird.new
# bird.singleton_class.include(Logging)
#p bird.make_noise

p Duck.new.make_noise
#p duck.make_noise

