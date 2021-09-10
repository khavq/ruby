require 'sinatra'
require 'thread'

class Front < Sinatra::Application
  class << self
    attr_accessor :getter
  end

  class Data
    def initialize
      @mutex = Mutex.new
    end
  
    def get
      @mutex.synchronize do
        @value = IO.read('idx.txt').to_i + 1
        IO.write('idx.txt', @value)
        @value
      end
    end
  end

  configure do
    IO.write('idx.txt', '0')
    Front.getter = Data.new
  end
  get '/' do
    Front.getter.get.to_s
  end
end

Front.run!