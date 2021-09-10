class MyClass
  #attr_accessor :name

  def initialize(name)
    @name = name
  end

  # def name
  #   "a"
  # end
end

c = MyClass.new("A")
c1 = MyClass.new("A")
def c1.name
  "1"
end

p c.name
p c1.name
