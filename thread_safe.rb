require 'concurrent'

class Subscribers
  def initialize
    @subscribers = [] #Concurrent::ThreadLocalVar.new{ [] }
  end

  def add_subscriber(subscriber)
    # @subscribers.value += [subscriber]
    @subscribers << subscriber unless @subscribers.include?(subscriber)
  end

  def notify
    @subscribers.value.each(&:call)
  end

  def remove_subscriber(subscriber)
    @subscribers.value -= [subscriber]
  end
end

SUBSCRIBERS = Subscribers.new

x = 0

10.times.map do |i|
  Thread.new do
    # puts "before (#{ i }): #{ x }"
    # x += 1
    # puts "after (#{ i }): #{ x }"
    SUBSCRIBERS.add_subscriber(rand(0..9))
    p SUBSCRIBERS.inspect
  end
end.each(&:join)

puts "\ntotal: #{ x }"