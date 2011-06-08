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
- Item
  - queue:Queue<Order>
  - amount:integer
  - orders:Array<Order>