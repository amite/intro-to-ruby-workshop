
# Getting Started with ruby

```ruby
 irb> “Hello World”
```

# Lets create a comic book store

Let’s *start* with a **single** comic book and give it a `title`.

```ruby
title = “Infinity Gauntlet”
```

So what’s it about? Let’s give it a `description`

```ruby
desc = “THE INFINITY GAUNTLET is a continuation of a story that originated in both the regular Silver Surfer series and the THANOS QUEST limited series. The gauntlet is perhaps the most powerful item in the Marvel Universe, as it bestows upon the wearer absolute control over time, space, power, the soul, the mind, and reality. Thanos obtains the gauntlet in order to finally win the hand of his love, Death, through the elimination of half the population of the entire universe. ”
```

When was it published? Let’s give it a `pub_date`

```ruby
pub_date = “September 28, 2011”
```

And what about who wrote it? Every comic book must have its `author`

```ruby
author = “Jim Starlin”
```

And an illustrator

```ruby
illustrator = “George Perez”
```

It’s not free so let’s give it a cost

```ruby
cost = $19.25
```

### Now let’s output the magic:

```ruby
“title was published on pub_date”
```

But that didn’t give us our values - did it? We need to `interpolate`

```ruby
“#{title} was published on #{pub_date}”
```

Abracadabra!

```
"Infinity Gauntlet was published on September 28, 2011"
```

Let’s add another one and this time let’s assign it a category.













