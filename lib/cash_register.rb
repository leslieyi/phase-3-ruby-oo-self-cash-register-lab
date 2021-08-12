require "pry"

class CashRegister
attr_reader :discount
attr_accessor :total,  :items
  def initialize(discount= 0)
    @total = 0
    @discount = discount
    @items = []
  end 

  def add_item(title, price, quantity = 1)
   self.total += price * quantity
   quantity.times{ @items << title} #need add it for the quantity of the title(title of the item)

   @history = {price: price, quantity: quantity} #creating something so we can access the last purchased value, using price and quantity 
  end 
  
  def apply_discount
    if self.discount > 0
    self.total -= (self.total * (self.discount / 100.0)).to_i
    "After the discount, the total comes to $#{self.total}."
    else 
      "There is no discount to apply."
    end 
  end 

  def void_last_transaction
    self.total -= @history[:price]*@history[:quantity]

  end 

end 
