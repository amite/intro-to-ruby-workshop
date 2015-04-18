
def description_of(superhero)
  case superhero
  when "batman"
    ['specialty: gadgets', 'power: stealth']
  when "wolverine"
    ['specialty: healing', 'power: titanium strength']
  when "doctor strange"
    ['specialty: magic', 'power: supernatural']
  else
    "has no superpowers"
  end
end

if $0 == __FILE__
  puts "superhero has"
  puts description_of("wolverine")
end