class Item
  attr_reader :name, :amount, :orders
  
  def initialize(args)
     args.keys.each { |name| instance_variable_set "@" + name.to_s, args[name] }
     @orders = []
  end
  
  def rent!(customer)
    if @amount.zero?
      raise RuntimeError.new("There is no #{@name} left.")
    end
    @orders << customer
    @amount -= 1
  end
end