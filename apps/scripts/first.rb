#!/usr/bin/ruby

# p "this is how you script in ruby"

# p `ruby -v`

def description_of(superhero)
  case superhero
  when "batman"
    ['']
  when "paul"
    ['gender: male', 'height: 145']
  when "dawn"
    ['gender: female', 'height: 170']
  when "brian"
    ['gender: male', 'height: 180']
  else
    ['species: Trachemys scripta elegans', 'height: 6']
  end
end

if $0 == __FILE__
  puts "inhabitant is"
  puts description_of("paul")
end