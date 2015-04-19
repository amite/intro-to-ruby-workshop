# require_relative './config'

class Person

  attr_accessor :age, :name

  def initialize(name, age = 22)
    @name = name
    @age = age
  end

end

bob = Person.new("Bob")
# p bob.name
bob.age = 32
# p bob.age

puts bob.send(:age)

steve = Person.new("Steve", 22)
# p steve.name

send(:define_method, :greet) {|user| puts "hello #{user}"}

p greet "Fred"