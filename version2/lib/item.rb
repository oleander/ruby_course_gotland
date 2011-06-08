class Item
  attr_reader :name, :amount
  
  def initialize(args)
     args.keys.each { |name| instance_variable_set "@" + name.to_s, args[name] }
  end
  
  def rent!
    if @amount.zero?
      raise RuntimeError.new("There is no #{@name} left.")
    end
    @amount -= 1
  end
end