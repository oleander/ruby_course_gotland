require "spec_helper"

describe Item do
  context "rental" do
    before(:each) do
      @item = Item.new(amount: 10, name: "Boat")
      @customer = mock(Object)
    end

    it "should be possible to create a new item" do
      @item.amount.should eq(10)
      @item.name.should eq("Boat")
    end

    it "should be possible to rent an item" do
      @item.rent!(@customer)
      @item.amount.should eq(9)
    end
    
    it "should raise an error if trying to rent more than Item#amount" do
      lambda { 
        11.times do
          @item.rent!(@customer)
        end
      }.should raise_error(RuntimeError)
    end
    
    it "should keep Item#amount in sync with Item#orders" do
      2.times do
        @item.rent!(@customer)
      end
      
      @item.should have(2).orders
      @item.amount.should eq(8)
    end
    
    it "should be possible to rent an item, and them return it" do
      # @item.rent!(@customer)
    end
  end
end

# - queue:Queue<Order>
# - amount:integer
# - orders:Array<Order>