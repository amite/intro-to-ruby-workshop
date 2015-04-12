## Now let’s build a store

So what is a store? Its a collection of things isn’t it? How do we collect things in programming? We use `Arrays`

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

## The Ruby hash

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











