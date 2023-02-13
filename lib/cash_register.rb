 require 'pry'
 
 class CashRegister
    attr_reader :title
    attr_accessor :discount, :total, :items, :last_item
    
    def initialize(discount=nil, total=0, items=[])
        @discount=discount
        @total=total
        @items=items
    end
    def add_item(title, price, quantity=1)
        @title=title
        @price=price
        #@quantity=quantity
        self.total+=(price*quantity)
        quantity.times { @items.push(title) }
        self.last_item=price*quantity
    end

    def apply_discount
        if @discount
            percentage_discount=self.discount/100.0
            self.total = self.total-=(self.total*percentage_discount).to_i
            "After the discount, the total comes to $#{self.total}."
        else
            "There is no discount to apply."
        end
    end

    def void_last_transaction
        void_item = @items.pop(1)
        self.total -= self.last_item
    end
    
 end

cash_register=CashRegister.new
cash_register_with_discount=CashRegister.new(20)
#cash_register.add_item("Airsoft", 30, 2)
#cash_register.add_item("Ipad", 400)
#cash_register_with_discount.add_item("book", 100)
#binding.pry