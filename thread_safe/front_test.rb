require 'minitest/autorun'
require 'net/http'
require 'uri'
require 'concurrent'
require 'thread'
require_relative 'front'

class FrontTest < Minitest::Test
  def test_works
    front_thread = Thread.new do
      Front.run!
    end

    sleep 1
    numbers = Concurrent::Set.new
    threads = [ front_thread ]
    5.times do
      threads << Thread.start do
        200.times do
          numbers << Net::HTTP.get(URI('http://localhost:4567/')).to_i
        end
      end
    end
    threads.each { |t| t.join }
    assert_equal(1000, numbers.to_a.count)
    Front.stop!
  end
end