module Wrappable
  def new(*arguments, &block)
    instance = allocate
    wrappers.each { |mod| instance.singleton_class.include(mod) }
    instance.send(:initialize, *arguments, &block)

    instance
  end

  def wrap(mod)
    wrappers << mod
  end

  def wrappers
    @wrappers ||= []
  end
end

module Logging
  def make_noise
    puts "start make_noise"
    super
    puts "end make_noise"
  end
end

module Powered
  def make_noise
    puts "Powering up"
    super
    puts "Powering down"
  end
end

class Machine
  extend Wrappable
  wrap Powered

  def make_noise
    puts "Buzzzzz"
  end
end

class Bird
  extend Wrappable
  wrap Logging

  def make_noise
    puts "Chirp, chirp!"
  end
end

Bird.new.make_noise
puts "-------------"
Machine.new.make_noise