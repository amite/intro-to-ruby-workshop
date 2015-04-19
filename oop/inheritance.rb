#http://ruby.bastardsbook.com/chapters/oops/

require 'time'
class Person
   attr_accessor :name, :age, :sex, :birth_date, :birth_place, :death_date

  ## class methods
   def Person.load_with_info(n, bdate, ddate=nil)
      a = Person.new
      a.name = n
      a.birth_date = bdate
      a.death_date = ddate
      return a
   end

   ## instance methods
   def age
      ((alive? ? Time.now : Time.parse(death_date)) - Time.parse(birth_date)).to_i / 60 / 60 / 24 / 365
   end

   def alive?
     death_date.nil?
   end

end

class Actor < Person
  attr_accessor :filmography
end

class Writer < Person
  attr_accessor :published_works
end

w = Writer.load_with_info("F. Scott Fitzgerald", "September 24, 1896", "December 21, 1940")

# puts "#{w.name} lived to be #{w.age}"

array_of_folks = []
array_of_folks << Actor.load_with_info("Meryl Streep", "1949-06-22")
array_of_folks << Actor.load_with_info("Paul Newman", "1925-01-26", "2008-12-26")
array_of_folks << Writer.load_with_info("Jane Austen", "1775-12-16", "1817-07-18")
array_of_folks << Actor.load_with_info("Cary Grant", "1904-01-18", "1986-11-29")
array_of_folks << Actor.load_with_info("Kate Winslet", "1975-10-05")

array_of_folks << Writer.load_with_info("F. Scott Fitzgerald", "September 24, 1896", "December 21, 1940")
array_of_folks << Actor.load_with_info("Nicholas Cage", "1964-01-07")

puts "The following people have passed away: " + array_of_folks.select{|a| !a.alive?}.map{|a| "#{a.name}, #{a.age}"}.join('; ')

# Notice how the select method happily iterates through each Person, not caring whether he/she is an Actor or a Writer. All that matters is that the object have a name, age and alive? methods.