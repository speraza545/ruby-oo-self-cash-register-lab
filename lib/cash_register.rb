
class CashRegister
    attr_accessor :total, :discount
    def initialize(discount=0)
        @total = 0
        @discount = discount
        @items = []
        @last_item = 0
    end

    def add_item(title, price, quantity=1)
        @total += price * quantity
        @items += [title] * quantity
        @last_item = price * quantity
    end

    def apply_discount
        if @discount > 0
            new_total = @total * (1 - (@discount / 100.00))
            @total = new_total
            return "After the discount, the total comes to $#{total.to_int}."
        else
            return "There is no discount to apply."
        end
    end

    def items
        @items
    end

    def void_last_transaction
        if @items.length == 0
            @total = 0
        else
            @total = @total - @last_item
        end
    end
end