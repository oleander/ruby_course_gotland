class BeachWaterSports
  def initialize
    @orders  = []
    @amounts = 12
  end
  
  # @order Order An order object
  # @return Integer An ordernumber
  # Makes it possible to store order for later useage.
  def add_order(order)
    order_number = random
    @orders[order_number] = order
    order_number
  end
  
  # @nr Integer Deletes the given order numver
  # @return Order The order that has been deleted
  # Delete any given order
  def delete_order(nr)
    @orders.delete_at(nr)
  end
  
  # @return Integer An available random number
  # Returns a random number that hasn't been used by the {@orders} array
  def random
    begin
      r = rand(@amounts) + 1
    end while not @orders[r].nil?
    
    r
  end
end

class Order < Struct.new(:name, :type, :time)
  # @return Integer Time in seconds since order was created
  # Caching is turned off
  def time_since
    Time.now.to_i - self[:time].to_i
  end
  
  # @return String The owners name
  # Removes whitespace and newlines @ 
  # end and start of string
  # Caching is turned on
  def name
    @_name ||= self[:name].strip
  end
  
  # @return String Type of order
  # Removes whitespace and newlines @ 
  # end and start of string
  # Caching is turned on
  def type
    @_type ||= self[:type].strip
  end
end

bws = BeachWaterSports.new
puts "Welcome to the Beach Water Sports shop."

loop do
  [
    "Menu",
    "1. Rent",
    "2. Return",
    "3. End"
  ].each do |content|
    puts content
  end
  
  params = []
  
  # The given params from the user must begin with a number
  # A switch case would have been nicer, but this is good enough
  if gets =~ /^(\d+)/
    if $1 == "1" # Adding an order
      ["Your name", "What type do you want?"].each do |what|
        puts what
        params << gets
      end
      # Save the current time
      params << Time.now
      
      # Adding order
      puts "Your order number is #{bws.add_order(Order.new(*params))}"
    elsif $1 == "2" # Removing order
      puts "Enter your order number."
      order = bws.delete_order(gets.to_i)
      
      if order
        puts "You used the #{order.type} for about #{order.time_since} sec, thanks #{order.name}!"
      else
        puts "Wrong order number, please try again."
      end
    elsif $1 == "3" # Stops main loop
      puts "Thanks for using Beach Water Sports, bye!"; break
    end
  else
    # If the user enters any invalid option, this will be printed.
    puts "You have to enter a valid option."
  end
end