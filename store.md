## Now let’s build a store

So what is a store? Its a collection of things isn’t it? How do we collect things in programming? We use `Arrays`

### Introduction to Arrays

```ruby

comic_book_cart = [‘amazing spiderman’, ‘Return of Superman’, ‘The Thing’]

```

Here’s an array of prices

```ruby
comic_book_prices = [3.45, 4.50, 1.35]
```

Now we want these two pieces of data combined into one meaningful piece of data. So let’s try adding them:

```ruby
receipt = comic_book_prices + comic_book_cart
```

Now the output isn’t all that clear. I wish I could fix that quickly. Well, I think I’ll reach out for a gem. But which one? Let’s search for something that’s good for printing. So let’s first exit `irb` and do

```ruby
gem search print
```

Whoaa! That’s a lot of results. Now I know I have used `awesome print` so I’ll install it.

```ruby
gem install awesome_print
```

```
>> require 'awesome_print'
```

Alright, let’s try it out. Now let’s add up those arrays and again and aaah...much better. We can see the data structure we got. But is that what we want? Not really. Let’s try to get a data structure where the title and cost of the comic is grouped into individual arrays

```
receipt = comic_book_cart.zip(comic_book_prices)
```

That’s good.

What we want is like a map that has a key with the name of the book and the value that is the cost.

Makes sense? So what do we call this kind of data structure? Hashmap, Associative Array? In ruby, we call it a hash.


## To loop or not to loop.

Let’s do a while loop.

First we initialize some variables. We’ll need a counter and a count.

```
i = 0  # this is our counter
num = 10 #this is the number of times we want to read our comic book (cause they are addictive)

\# post and pre increment does not work in ruby

i += 1
```

and now the `for` loop:

```
>> for i in 1..10 do
?> puts "I read this book #{i} times"
>> end

I read this book 1 times
I read this book 2 times
I read this book 3 times
I read this book 4 times
I read this book 5 times
I read this book 6 times
I read this book 7 times
I read this book 8 times
I read this book 9 times
I read this book 10 times
=> 1..10
```



You can also do a `while` loop.

```
>> while (i < num) do
?> puts "I read this comic #{i} times"
>> i += 1
>> end
I read this comic 0 times
I read this comic 1 times
I read this comic 2 times
I read this comic 3 times
I read this comic 4 times
I read this comic 5 times
I read this comic 6 times
I read this comic 7 times
I read this comic 8 times
I read this comic 9 times
```

## But rubyists prefer each

```
(1..100).each do |k|
   puts "#{k}. This is Ruby preferred way of doing loops, when possible"
end

(1..100).each{ |k| puts "#{k}. Curly braces make it even shorter"}
```


### The Ruby hash

Now before we convert these arrays into a *meaningful* hash for our store, we need to look at the basics of creating a hash.
```
add bio hashes
```
Now let’s see if we can add those hashes. hmm...not easy. Let’s try to collect them into an array.

```
ap arr
[
    [0] {
              :name => "amit",
               :age => 39,
        :profession => "developer"
    },
    [1] {
              :name => "sunil",
               :age => 23,
        :profession => "trainer"
    }
]
```

Yes! That works. And we can access the values like a regular array. Now how do we turn this array of arrays into a hash?

Simple:

```
receipt = receipt.to_h
```

et Voila!

```
{
     "amazing spiderman" => 3.45,
    "Return of Superman" => 4.5,
             "The Thing" => 1.35
}
```

Now, there’s one thing thing missing in this `receipt` - that’s the total. What we want is something that looks like this

```
{"amazing spiderman"=>3.45, "Return of Superman"=>4.5, "The Thing"=>1.35, :total=>9.3}
```

Now to do this, we just add another key value datapair to this hash:

```
receipt[:total] = 9.3
```

Now that’s kind of cheating - no? Let’s actually add those individual prices. But first let’s delete that manually added `total` key.

```
receipt.delete(:total)
```

And we are back to normal. Now let’s add those prices. First we need to access only the values. We can do this with

```
receipt.values
```

Then we loop over them and add them up.

```
total = receipt.values.inject { |val, counter| val + counter  }
```

Notice that `counter` variable? You get for free when you use the `inject` method.

Now with that `total` variable in our hand, we just append to that hash:

```
receipt[:total] = total
```

And we get the receipt structure we want:

```
{"amazing spiderman"=>3.45, "Return of Superman"=>4.5, "The Thing"=>1.35, :total=>9.3}
```

## Scripting with ruby

Working with irb is great - especially when you want to test your assumptions about how a specific language feature works in ruby. But if we are going to running proper programs, we better write them down right?

So open up your favourite text editor and let’s write down our first program.

```
\#!/usr/bin/ruby

\# p "this is how you script in ruby"

\# And that’s how you comment out scripts in ruby

puts ruby -v # this won’t work. You need backticks.

p `ruby -v`
```

## Functions

Let’s create `superpowers.rb`

```
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
```

You can also execute this script from the command-line:

```
ruby superpowers.rb
```

That was also your first look at case statements btw.


## Intro to Object Oriented Programming in Ruby

So what is oop? Why do we need it? What’s the difference?

Before we answer that question, it’s good to take a step back and think about how we think about our programs. If we just think about them as a series of steps that need to be executed, things are going to get complicated really soon.

As programs grow more complex, the number of steps and their sequential execution will be hard to keep track of and we will find ourselves lost in tracing our steps.

Even more problematic, we are thinking about our code purely in terms of syntax, scalar values, procedures and data structures. This means we have no clear way to communicate what we are building. We seem to be building stacks of code and storing them into files and hoping the damn thing runs.

This way the act of coding seems to have no relationship with what is being built.  You can say you are building a file uploader but really the context is missing. The real story is that you are building a feature that let logged in users i.e. members and their families upload photos and videos to the cloud.

Or you are building an online service that lets students store, share and access their notes with their friends as a group.

What seems to be happening is that we are building X so that Y solves a problem Z. We need a higher level of communication for building this and that is the language of objects.

Objects give you a way to make sense of code. It allows you to think in terms of state and behavior. And that really matters. Because when we name things according to the role they are playing, those things become easier to understand and manipulate.

Here is a basic class in ruby:

```
class Person
  def initialize(name, age)
    @name = name
    @age = age
  end
end

bob = Person.new("Bob", 25)
p bob

steve = Person.new("Steve", 22)
p steve.name
```

These are two instances we have created out of this class. `@name` and `@age` are **instance variables**. An instance variable is a variable that holds the data for the current instance of the class.

You can set default values while setting up an instance:

```
def initialize(name, age = 22)
  @name = name
  @age = age
end
```

The methods inside the class are called `getters` and `setters`. You cannot access instance variables directly (you can with `instance_variable_get` but you really shouldn't).

This is what a setter looks like:

```
def age=(age)
  @age = age
end
```

But these just add boilerplate. Instead we can use some sweet ruby magic:

`attr_accessor :age, :name`

> In Ruby, nearly everything is an object. Classically object-oriented languages define an object as something that maintains state and exhibits behavior. While this is true in Ruby, I think it is more precise to say that Ruby objects contain other objects and respond to messages. You might say that Ruby is a ‘message oriented’ language.

- ()[http://rubylearning.com/blog/2010/11/03/do-you-understand-rubys-objects-messages-and-blocks/]

Now `age` and `name` are just functions inside a class. And we can call them `methods`. But in ruby you can also understand them as `messages` sent to objects.

>Object-Oriented Design is about the messages that get sent between objects and not the objects themselves. - *integralist blog*

An object does not have a static type. It is what it does and that means it is what it responds to. And infact we have a built in method in ruby with that name `respond_to`

```
puts bob.respond_to?(:age)
```

Now this means that the object bob can respond to this message. You can make another object and make it respod to the `age` object. You don't have to check type. So what happens when you call this method on the bob object you are actually sending it a message.

```
puts bob.send(:age)
```

```
1.send :+, 2
1.+ 2       # same thing
1 + 2       # same thing
```
Alsow ith strings:

Now 2 is the parameter send to the :+ method.

This is why you can do

```
1.next # => 2
```

```
"cool".send(:upcase)
```

Now if you looka this expression, you see the method being passed as a parameter. This also means you can also define methods on the fly in ruby.

Let's create a method called `greet`:

send(:define_method, :greet) {|user| puts "hello #{user}"}

which is exactly the same as defining a method statically like:

def greet(user)
  "hello #{user}"
end




##### This is how you connect to mongodb:

```
require "bundler"
Bundler.require

Mongoid.load! File.expand_path("../mongodb.yml", __FILE__), :development
```





## Building the Sinatra App

The simplest way to say `hello world` on the web is no doubt with Sinatra. (http://www.sinatrarb.com/)[Sinatra] is one of the easiest micro-frameworks you can work with in ruby.

```
require "sinatra"

get '/hello' do
  "Hello world"
end

get '/goodbye' do
  "goodbye world"
end
```

This is how you capture params:

```
get '/hello/:name' do
  "Hello #{params[:name]}"
end
```

Working with splat

```
get '/say/*/to/*' do
  "Say #{params[:splat][0]} to #{params[:splat][1]}"
end

Serving route based on conditional:

```
get '/', host_name: 'localhost' do
  "#{request.env.inspect}"
end
```

Serving simple views

```
get '/' do
  erb :index
end
```

```
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Simple Views with Sinatra</title>
</head>
<body>
  <h1>Simple Views with Sinatra</h1>
  <h2><%= Time.now %></h2>
</body>
</html>
```
Modular app setup

1. Create a lib directory with `models` and `views` folder
2. Create a config.ru that requires the app
3. Replace current code with class
4. Run `shotgun config.ru`

```
require "sinatra"

class App < Sinatra::Base
  get '/' do
    erb :index
  end
end
```

Format `Time.now`

```
Time.now.strftime("%a %I:%M %B %y %Y")
```

Switching to layout with `yield`

```
<!DOCTYPE html>
<html>
  <head>
    <meta/>
    <link rel='stylesheet' href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css"></link>
    <link rel='stylesheet' href="/css/app.css"></link>
    <script src="//code.jquery.com/jquery-2.1.0.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
  </head>
  <body>
    <nav class="navbar navbar-default navbar-static-top">
      <ul class="navbar-nav nav">
        <li>
          <a href="/">Home</a>
        </li>
        <li>
          <a href="/comics">Comics</a>
        </li>
        <li>
          <a href="/comics/new">New comic</a>
        </li>
      </ul>
    </nav>
    <div class="container">
      <%= yield %>
    </div>
  </body>
</html>
```

```
get '/' do
  erb :"comics/index"
end
```

### Super short intro mongodb

Mongodb is a nosql data store based on documents. You get a `database`. The database contains `collections` (which you can think of as tables). And each collection contains `documents` which you can think of as records.













