# BeachWaterSports

## How to use

Run this line in your console.

``` bash
ruby beach_water_sports.rb
```

## Options

When starting the application you'll asked to pass one of the following params.  
*You may only pass an integer, everything else will be ignored.*

1. Rent
2. Return
3. End

### Why, what?

- The first option (**1**) makes it possible to rent any given item.
- The second param (**2**) makes it possible to return any rented item.
- The last (**3**) option will stop the main loop and the application will terminate.

## Assumptions and other details.

- The given code base is written in english.
- Any change regarding the codebase can be view @ Github. See the [DEVLOG](https://github.com/oleander/ruby_course_gotland/blob/master/beach_water_sports/DEVLOG.md) file for more info.
- The documentation is written in markdown.

## Structure

### Classes

- BeachWaterSports
  - + add_order(Order order):Integer
  - + delete_order(Integer nr):Order
  - - random():Integer
  - - @orders:Array
  - - @amounts:Integer
- Order
  - + time_since():Integer
  - + name():String
  - + type():String
  - + time():Time

Take a look at the [comments](https://github.com/oleander/ruby_course_gotland/blob/master/beach_water_sports/beach_water_sports.rb) for more info. 

## Requirements

Tested using OS X 10.6.7 with Ruby 1.9.2.