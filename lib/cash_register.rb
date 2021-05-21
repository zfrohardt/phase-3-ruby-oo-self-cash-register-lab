require 'pry'
class CashRegister
    attr_accessor :total, :discount, :items, :last_tx

    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @items = []
        @last_tx = 1
    end

    def add_item(item, price, quantity = 1)
        quantity.times do
            @items.push [item, price]
        end
        @last_tx = quantity
        @total += price * quantity
    end

    def apply_discount
        if @discount == 0
            return "There is no discount to apply."
        end

        @total = (@total * (100-discount)) / 100
        "After the discount, the total comes to $#{@total}."
    end

    def items
        @items.collect { |item| item[0] }
    end

    def void_last_transaction
        @last_tx.times do
            item = @items.pop
            @total -= item[1]
        end
    end
end