# Version 2

## Classes

- Customer
  - name:String
  - orders:Array<Order>
- Store
  - items:Array<Item>
  - customers:Array<Customer>
- Order
  - rented_at:Date
  - returned_at:Date
  - returned:boolean
  - customer:Customer
- Item
  - queue:Queue<Order>
  - amount:integer
  - orders:Array<Order>
    
## Simple relation sketch

![sketch](http://i.imgur.com/LZ8gE.jpg)