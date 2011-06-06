class BeachWaterSports
  def initialize
    @orders = []
  end
  
  def add_order(order)
    order_number = random
    @orders[order_number] = order
    order_number
  end
  
  def delete_order(nr)
    @orders.delete_at(nr)
  end
  
  def random
    begin
      r = rand(12) + 1
    end while not @orders[r].nil?
    
    r
  end
end

class Order < Struct.new(:name, :type, :time)
  def time_since
    Time.now.to_i - self[:time].to_i
  end
  
  def name
    @_name ||= self[:name].strip
  end
  
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
  
  if gets =~ /^(\d+)/
    if $1 == "1"
      ["Your name", "What type do you want?"].each do |what|
        puts what
        params << gets
      end
      params << Time.now
      puts "Your order number is #{bws.add_order(Order.new(*params))}"
    elsif $1 == "2"
      puts "Enter your order number."
      order = bws.delete_order(gets.to_i)
      
      if order
        puts "You used the #{order.type} for about #{order.time_since} sec, thanks #{order.name}!"
      else
        puts "Wrong order number, please try again."
      end
    elsif $1 == "3"
      puts "Thanks for using Beach Water Sports, bye!"; break
    end
  else
    puts "You have to enter a valid option"
  end
end